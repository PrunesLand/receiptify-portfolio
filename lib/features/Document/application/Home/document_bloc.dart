import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/Model/Image/image_model.dart';
import '../../utils.dart';
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
            OcrResult = await compute(
              TextRecognitionEngine,
              state.list.first!.file!,
            );
          } catch (e) {
            print('Error processing image: ${e}');
            return;
          }

          emit(state.copyWith(textData: OcrResult));
        },
      );
    });
  }
}
