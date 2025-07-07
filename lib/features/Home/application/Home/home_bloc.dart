import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Home/Index.dart';
import 'package:uuid/uuid.dart';

import '../../domain/image_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
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
