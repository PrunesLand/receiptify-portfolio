import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:receipt_app/core/FireBaseAuth.dart';
import 'package:receipt_app/features/Onboarding/Domain/Models/LoginUserModel.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthSingleton _firebaseAuthSingleton;
  final Logger _logger;
  LoginBloc(this._firebaseAuthSingleton, this._logger)
    : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        isLoading: () async {
          emit(state.copyWith(isLoading: true));
        },
        loginUser: (LoginUserModel user) async {
          emit(state.copyWith(isLoading: true));

          try {
            await _firebaseAuthSingleton.signInWithEmailAndPassword(
              email: user.email,
              password: user.password,
            );
            emit(state.copyWith(isLoading: false, finishLogin: true));
          } catch (e) {
            _logger.e("Error logging in firebase: $e");
            emit(state.copyWith(isLoading: false, loginFailed: true));
          }
        },
      );
    });
  }
}
