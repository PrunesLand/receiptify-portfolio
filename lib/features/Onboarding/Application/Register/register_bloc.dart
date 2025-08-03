import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await event.when(
        isLoading: () async {
          emit(state.copyWith(isLoading: true));
        },
        emailChanged: (String email) async {
          emit(state.copyWith(email: email));
        },
        passwordChanged: (String password) async {
          emit(state.copyWith(password: password));
        },
      );
    });
  }
}
