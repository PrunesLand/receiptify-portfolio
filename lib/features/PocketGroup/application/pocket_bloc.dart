import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/PocketGroup/domain/index.dart';
import 'package:uuid/uuid.dart';

import 'index.dart';

class PocketBloc extends Bloc<PocketEvent, PocketState> {
  PocketBloc() : super(const PocketState()) {
    on<PocketEvent>((event, emit) async {
      await event.when(
        addPocket: (PocketModel pocket) async {
          final uuid = Uuid().v4();

          final newPocket = pocket.copyWith(id: uuid);

          final newList = [newPocket, ...state.pockets];

          emit(state.copyWith(pockets: newList));
        },
        removePocket: (String id) async {
          emit(state.copyWith(id: ''));
        },
      );
    });
  }
}
