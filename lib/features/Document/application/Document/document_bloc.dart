import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/core/index.dart';
import 'package:receipt_app/features/Document/Index.dart';
import 'package:uuid/uuid.dart';

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
          if (imageToRemove != null && imageToRemove.file != null) {
            try {
              final file = File(imageToRemove.file!.path);
              if (await file.exists()) {
                await file.delete();
                print('Deleted file: ${file.path}');
              }
              final removedAmount =
                  double.tryParse(imageToRemove.content) ?? 0.0;
              updatedTotalExpense -= removedAmount;
            } catch (e) {
              print('Error deleting file: $e');
            }
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
          // -- Add image to state list --
          List<ImageModel?> newList = state.list;
          try {
            final uuid = Uuid().v4();
            final savedFile = await saveImageToMainPocketDirectory(file, uuid);

            final addedImage = ImageModel(
              id: uuid,
              content: '',
              file: savedFile,
            );

            newList = [addedImage, ...state.list];
          } catch (e) {
            print('Error adding image: $e');
          }
          emit(state.copyWith(list: newList, OcrLoading: true));

          // -- Check if list is empty --
          if (state.list.isEmpty || state.list.first?.file == null) {
            print('No image file to process.');
            emit(state.copyWith(OcrLoading: false));
            return;
          }

          emit(state.copyWith(OcrLoading: true));

          // -- AI image feeding process --
          final ImageModel itemToProcess = state.list.first!;
          final Uint8List originalImageFile =
              await itemToProcess.file!.readAsBytes();

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

            final prompt = TextPart("Return total expense. Answer in Decimals");

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

            // Log token usage
            final usageMetadata = response.usageMetadata;
            if (usageMetadata != null) {
              print('Tokens prompt used: ${usageMetadata.promptTokenCount}');
              print(
                'Tokens candidates used: ${usageMetadata.candidatesTokenCount}',
              );
              print('Tokens in total used: ${usageMetadata.totalTokenCount}');
            }

            totalStopwatch.stop();
            final newItem = itemToProcess.copyWith(
              content: response.text ?? 'No data.',
            );

            final updatedList =
                state.list.map((itemInTheList) {
                  if (itemInTheList!.id == newItem.id) {
                    return newItem;
                  }
                  return itemInTheList;
                }).toList();

            final list = updatedList;
            double total = 0.0;
            for (final item in list) {
              total += double.tryParse(item.content) ?? 0.0;
            }
            emit(
              state.copyWith(
                OcrLoading: false,
                list: updatedList,
                totalExpenseMain: total.toStringAsFixed(2).toString(),
              ),
            );
            print(
              'Total time for the entire process: ${totalStopwatch.elapsedMilliseconds} ms',
            );
            await _userStorageRepository.addDocumentToMainPocket(
              originalImageFile,
              newItem.id,
              newItem.content,
            );
          } catch (e) {
            print('Error processing image in DocumentBloc: ${e.toString()}');
            emit(state.copyWith(OcrLoading: false));
            return;
          }
        },
        loadSavedFiles: () async {
          final imageDir = await getMainPocketDirectory();

          if (!await imageDir.exists()) {
            print('Image directory does not exist.');
            return;
          }
        },
      );
    });
  }
}
