import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Onboarding/Domain/Models/LoginUserModel.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        isLoading: () async {
          emit(state.copyWith(isLoading: true));
        },
        loginUser: (LoginUserModel user) {},
      );
    });
  }
}
