import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Document/index.dart';
import 'package:receipt_app/features/User/index.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/Receipt/ReceiptModel.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final IUserStorageRepository _userStorageRepository;

  DocumentBloc(this._userStorageRepository) : super(const DocumentState()) {
    on<DocumentEvent>((event, emit) async {
      await event.when(
        loading: () async {
          emit(state.copyWith(isLoading: true));
        },
        removeImage: (String id) async {
          final imageToRemove = state.list.firstWhere(
            (item) => item!.id == id,
            orElse: () => null,
          );

          double updatedTotalExpense =
              double.tryParse(state.totalExpenseMain) ?? 0.0;

          if (imageToRemove != null) {
            if (imageToRemove.file != null) {
              try {
                final file = File(imageToRemove.file!.path);
                if (await file.exists()) {
                  await file.delete();
                  print('Deleted file: ${file.path}');
                }
              } catch (e) {
                print('Error deleting file: $e');
              }
            }
            final removedAmount = double.tryParse(imageToRemove.cost) ?? 0.0;
            updatedTotalExpense -= removedAmount;
            print(
              'Item cost to remove: ${imageToRemove.cost}, Parsed amount: $removedAmount, New total: $updatedTotalExpense',
            );
          } else {
            print(
              'Item with id $id not found in the list. Total expense not changed.',
            );
          }

          final tempList = state.list.where((item) => item!.id != id).toList();
          emit(
            state.copyWith(
              list: tempList,
              totalExpenseMain: updatedTotalExpense.toStringAsFixed(2),
            ),
          );

          await _userStorageRepository.deleteDocumentFromMainPocketByFileName(
            id,
          );
        },

        processImage: (File file) async {
          // -- Set loading state --
          emit(state.copyWith(OcrLoading: true));

          // -- AI image feeding process --
          final Uint8List originalImageFile = await file.readAsBytes();
          final totalStopwatch = Stopwatch()..start();
          final geminiStopwatch = Stopwatch();

          try {
            if (originalImageFile.isEmpty) {
              throw Exception("Image data is empty before feeding to the AI.");
            }

            final generationConfig = GenerationConfig(
              responseMimeType: 'text/plain',
            );
            final GenerativeModel model;
            model = FirebaseAI.googleAI().generativeModel(
              model: 'gemini-2.5-flash-lite',
              generationConfig: generationConfig,
            );

            final prompt = TextPart("""
              If its not a receipt/invoice, return 'false' and immediately stop.
              Return total expense. Answer in Decimals. 
              Select category fits best: {food, entertainment, travel, others}. if unsure, pick others.
              Get receipt date. if none, return today date. format: dd/mm/yy
              return string separated by comma.
              """);

            final imagePart = InlineDataPart('image/jpeg', originalImageFile);

            print('Sending request to Gemini...');
            geminiStopwatch.start();
            final response = await model.generateContent([
              Content.multi([prompt, imagePart]),
            ]);
            geminiStopwatch.stop();
            print('GEMINI RESPONSE ${response.text}');
            print(
              'Time to get response from Gemini: ${geminiStopwatch.elapsedMilliseconds} ms',
            );

            // Check if response text is null or empty or "false"
            if (response.text == null ||
                response.text!.trim().toLowerCase() == "false") {
              print('Gemini response indicates not a receipt or is invalid.');
              emit(state.copyWith(OcrLoading: false)); // Stop loading
              // Optionally, you can show a message to the user here
              return; // Exit the function, do not add to list
            }

            // Log token usage
            final usageMetadata = response.usageMetadata;
            if (usageMetadata != null) {
              print('Tokens prompt used: ${usageMetadata.promptTokenCount}');
              print(
                'Tokens candidates used: ${usageMetadata.candidatesTokenCount}',
              );
              print('Tokens in total used: ${usageMetadata.totalTokenCount}');
            }

            // -- If Gemini response is valid, then add image to state list --
            final uuid = Uuid().v4();
            final savedFile = await saveImageToMainPocketDirectory(file, uuid);

            final addedImage = ReceiptModel(
              id: uuid,
              cost: await getCostFromString(
                response.text!,
              ), // Parse cost from valid response
              file: savedFile,
              receiptDate: await getDateFromString(
                response.text!,
              ), // Parse date from valid response
              category: await getExpenseEnumFromString(
                response.text!,
              ), // Parse category
            );

            List<ReceiptModel?> newList = [addedImage, ...state.list];

            totalStopwatch.stop();
            print(
              "PRUNE: ${await getExpenseEnumFromString(response.text!)}",
            ); // Use response.text!

            double total = 0.0;
            for (final item in newList) {
              // Recalculate total with the new item
              total += double.tryParse(item!.cost) ?? 0.0;
            }

            emit(
              state.copyWith(
                OcrLoading: false,
                list: newList,
                totalExpenseMain: total.toStringAsFixed(2),
              ),
            );
            print(
              'Total time for the entire process: ${totalStopwatch.elapsedMilliseconds} ms',
            );
            await _userStorageRepository.addDocumentToMainPocket(
              imageBytes: originalImageFile,
              fileName: addedImage.id, // Use addedImage properties
              totalExpense: addedImage.cost,
              dateOfReceipt: addedImage.receiptDate,
            );
          } catch (e) {
            print('Error processing image in DocumentBloc: ${e.toString()}');
            // If an error occurs (other than the "false" check),
            // we also don't add the item and just stop loading.
            emit(state.copyWith(OcrLoading: false));
            return;
          }
        },
        loadSavedFiles: () async {
          try {
            final imageDir = await getMainPocketDirectory();

            if (!await imageDir.exists()) {
              print('Image directory does not exist.');
              return;
            }

            final loadedList =
                await _userStorageRepository.getAllDocumentsFromMainPockets();

            double total = 0.0;
            for (final item in loadedList) {
              total += double.tryParse(item?.cost ?? '0') ?? 0.0;
            }

            emit(
              state.copyWith(
                list: loadedList,
                totalExpenseMain: total.toStringAsFixed(2),
                OcrLoading: false,
              ),
            );
          } catch (e) {
            print('Error loading saved files: $e');
          }
        },
        addNewReceipt: (ReceiptModel receipt) async {
          final uuid = Uuid().v4();
          List<ReceiptModel?> updatedList = List.from(state.list);
          final newReceipt = receipt.copyWith(id: uuid);
          updatedList.add(newReceipt);

          switch (state.chipEnum) {
            case DocumentChipEnum.highest:
              updatedList.sort((a, b) {
                final costA = double.tryParse(a!.cost) ?? 0.0;
                final costB = double.tryParse(b!.cost) ?? 0.0;
                return costB.compareTo(costA);
              });
              break;
            case DocumentChipEnum.lowest:
              updatedList.sort((a, b) {
                final costA = double.tryParse(a!.cost) ?? 0.0;
                final costB = double.tryParse(b!.cost) ?? 0.0;
                return costA.compareTo(costB);
              });
              break;
            default:
              updatedList.sort((a, b) {
                if (a!.receiptDate == null && b!.receiptDate == null) return 0;
                if (a.receiptDate == null) return 1;
                if (b!.receiptDate == null) return -1;
                return b.receiptDate!.compareTo(a.receiptDate!);
              });
              break;
          }

          double total = 0.0;
          for (final item in updatedList) {
            total += double.tryParse(item?.cost ?? '0') ?? 0.0;
          }
          await _userStorageRepository.addDocumentToMainPocket(
            fileName: newReceipt.id,
            totalExpense: newReceipt.cost,
            dateOfReceipt: newReceipt.receiptDate,
          );
          emit(
            state.copyWith(
              list: updatedList,
              totalExpenseMain: total.toStringAsFixed(2),
            ),
          );
        },
        chipSelect: (DocumentChipEnum value) async {
          switch (value) {
            case DocumentChipEnum.highest:
              final sortedList = List.of(state.list);
              sortedList.sort((a, b) {
                final costA = double.tryParse(a!.cost) ?? 0.0;
                final costB = double.tryParse(b!.cost) ?? 0.0;
                return costB.compareTo(costA);
              });
              emit(
                state.copyWith(
                  list: sortedList,
                  chipEnum: DocumentChipEnum.highest,
                ),
              );
              break;

            case DocumentChipEnum.lowest:
              final sortedList = List.of(state.list);
              sortedList.sort((a, b) {
                final costA = double.tryParse(a!.cost) ?? 0.0;
                final costB = double.tryParse(b!.cost) ?? 0.0;
                return costA.compareTo(costB);
              });
              emit(
                state.copyWith(
                  list: sortedList,
                  chipEnum: DocumentChipEnum.lowest,
                ),
              );
              break;
            case DocumentChipEnum.latest:
              final sortedList = List.of(state.list);
              sortedList.sort((a, b) {
                if (a!.receiptDate == null && b!.receiptDate == null) return 0;
                if (a.receiptDate == null) return 1;
                if (b!.receiptDate == null) return -1;

                return b.receiptDate!.compareTo(a.receiptDate!);
              });
              emit(
                state.copyWith(
                  list: sortedList,
                  chipEnum: DocumentChipEnum.latest,
                ),
              );
              break;
          }
        },
      );
    });
  }
}
