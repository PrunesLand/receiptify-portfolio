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
          final ImageModel item = state.list.first!;
          final oldList = state.list;

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
              item.file!.readAsBytesSync(),
            );

            final response = await model.generateContent([
              Content.multi([prompt, imagePart]),
            ]);
            print('PRUNE GEMINI RESPONSE');
            final newItem = item.copyWith(content: response.text ?? 'No data.');

            final newList =
                oldList.map((itemInTheList) {
                  // Check if the current item is the one we want to replace
                  if (itemInTheList!.id == newItem.id) {
                    // If it is, return the updated version
                    return newItem;
                  } else {
                    // Otherwise, return the original item unchanged
                    return itemInTheList;
                  }
                }).toList();

            emit(state.copyWith(OcrLoading: false, list: newList));
          } catch (e) {
            print('Error processing image: ${e.toString()}');
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
