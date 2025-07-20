import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            fileName: '',
            file: File(file.path),
          );

          final newList = [addedImage, ...state.list];

          emit(state.copyWith(list: newList));
        },
        removeImage: (String id) {
          final tempList = state.list.where((item) => item!.id != id).toList();
          emit(state.copyWith(list: tempList));
        },
        processImage: () async {
          final String OcrResult;
          try {
            final generationConfig = GenerationConfig(
              responseMimeType: 'text/plain',
            );
            final GenerativeModel model;
            model = FirebaseAI.googleAI().generativeModel(
              model: 'gemini-2.5-flash',
              generationConfig: generationConfig,
            );

            final prompt = TextPart("What's in the picture?");
            final imagePart = InlineDataPart(
              'image/jpeg',
              state.list.first!.file!.readAsBytesSync(),
            );

            final response = await model.generateContent([
              Content.multi([prompt, imagePart]),
            ]);
            print('PRUNE GEMINI RESPONSE');
            OcrResult = response.text ?? 'There was an issue with the analysis';
          } catch (e) {
            print('Error processing image: ${e.toString()}');
            return;
          }

          emit(state.copyWith(textData: OcrResult, AddDocModalOpen: false));
        },
        toggleAddDocModal: () {
          emit(state.copyWith(AddDocModalOpen: true));
        },
      );
    });
  }
}
