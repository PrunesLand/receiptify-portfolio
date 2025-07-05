import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        isLoading: () async {
          emit(state.copyWith(isLoading: true));
        },
      );
    });
  }
}
