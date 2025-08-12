import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:receipt_app/core/FireBaseAuth.dart';
import 'package:receipt_app/features/Onboarding/Domain/index.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuthSingleton _firebaseAuth;
  final Logger _logger;

  RegisterBloc(this._firebaseAuth, this._logger)
    : super(const RegisterState()) {
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
        register: (RegisterUserModel user) async {
          emit(state.copyWith(isLoading: true));

          try {
            await _firebaseAuth.createUserWithEmailAndPassword(
              email: user.email,
              password: user.password,
            );

            await Future.delayed(const Duration(seconds: 5));
            emit(state.copyWith(isLoading: false, finishRegister: true));
          } catch (e) {
            _logger.e(
              'Error when creating user to firebase',
              error: e.toString(),
            );
            emit(state.copyWith(isLoading: false, registrationFailed: true));
          }
        },
        closeErrorPopup: () {
          emit(state.copyWith(registrationFailed: false));
        },
      );
    });
  }
}
