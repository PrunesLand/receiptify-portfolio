import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/image_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        isLoading: () async {
          emit(state.copyWith(isLoading: true));
        },
        addImage: (String fileName, String filePath) async {
          final uuid = Uuid().v4();
          final addedImage = ImageModel(
            id: uuid,
            fileName: fileName,
            file: File(filePath),
          );

          final newList = [addedImage, ...state.list];

          emit(state.copyWith(list: newList));
        },
        removeImage: (String id) {
          final tempList = state.list;
          tempList.removeWhere((item) => item?.id == id);
          emit(state.copyWith(list: tempList));
        },
      );
    });
  }
}
