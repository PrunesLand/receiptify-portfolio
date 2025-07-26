import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uuid/uuid.dart';

import '../../domain/Model/Image/image_model.dart';
import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(const DocumentState()) {
    on<DocumentEvent>((event, emit) async {
      await event.when(
        loading: () async {
          emit(state.copyWith(isLoading: true));
        },
        addImage: (File file) async {
          final uuid = Uuid().v4();

          final addedImage = ImageModel(
            id: uuid,
            content: '',
            file: File(file.path),
          );

          final newList = [addedImage, ...state.list];

          emit(state.copyWith(list: newList, OcrLoading: true));
        },
        removeImage: (String id) {
          final tempList = state.list.where((item) => item!.id != id).toList();
          emit(state.copyWith(list: tempList));
        },
        processImage: () async {
          if (state.list.isEmpty || state.list.first?.file == null) {
            print('No image file to process.');
            emit(state.copyWith(OcrLoading: false));
            return;
          }

          emit(state.copyWith(OcrLoading: true));

          final ImageModel itemToProcess = state.list.first!;
          final File originalImageFile = itemToProcess.file!;

          final totalStopwatch = Stopwatch()..start();
          final compressionStopwatch = Stopwatch();
          final geminiStopwatch = Stopwatch();
          try {
            print(
              'Original image size: ${await originalImageFile.length() / (1024 * 1024)} MB',
            );

            final Uint8List? compressedImageBytes =
                await FlutterImageCompress.compressWithFile(
                  // ignore: cascade_invocations
                  originalImageFile.absolute.path,
                  quality: 70,
                  minWidth: 1280,
                  minHeight: 1024,
                  format: CompressFormat.jpeg,
                );

            Uint8List imageBytesToSend;
            compressionStopwatch.start();
            // Simulate compression time
            await Future.delayed(const Duration(milliseconds: 100));
            if (compressedImageBytes != null &&
                compressedImageBytes.isNotEmpty) {
              print(
                'Compressed image size: ${compressedImageBytes.lengthInBytes / (1024 * 1024)} MB',
              );
              imageBytesToSend = compressedImageBytes;
            } else {
              print(
                'Compression failed or resulted in empty bytes. Falling back to original.',
              );
              imageBytesToSend = await originalImageFile.readAsBytes();
            }
            compressionStopwatch.stop();
            print(
              'Time to compress image: ${compressionStopwatch.elapsedMilliseconds} ms',
            );

            if (imageBytesToSend.isEmpty) {
              throw Exception("Image data is empty after compression attempt.");
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

            final imagePart = InlineDataPart('image/jpeg', imageBytesToSend);

            print('Sending request to Gemini...');
            geminiStopwatch.start();
            final response = await model.generateContent([
              Content.multi([prompt, imagePart]),
            ]);
            geminiStopwatch.stop();
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

            emit(state.copyWith(OcrLoading: false, list: updatedList));
            print(
              'Total time for the entire process: ${totalStopwatch.elapsedMilliseconds} ms',
            );
          } catch (e) {
            print('Error processing image in DocumentBloc: ${e.toString()}');
            emit(state.copyWith(OcrLoading: false));
            return;
          }
        },
        toggleAddDocModal: () {
          emit(state.copyWith(AddDocModalOpen: true));
        },
      );
    });
  }
}
