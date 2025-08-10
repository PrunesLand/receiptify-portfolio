import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Onboarding/Application/index.dart';
import 'package:receipt_app/features/Onboarding/Domain/index.dart';
import 'package:receipt_app/features/Onboarding/presentation/Widgets/CustomTextField.dart';

import '../../../core/service_locator.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listenWhen: (previous, current) => current.finishRegister,
        listener: (context, state) {
          if (state.finishRegister) GoRouter.of(context).replace('/login');
        },
        builder:
            (context, state) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body:
                  state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Center(
                              child: Text('Register a new account'),
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      labelText: 'Email',
                                      inputType: TextInputType.emailAddress,
                                      regexPattern: RegExp(
                                        r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
                                      ),
                                      onChange: (value) {
                                        setState(() {
                                          _email = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    CustomTextField(
                                      labelText: 'Password',
                                      inputType: TextInputType.visiblePassword,
                                      onChange: (value) {
                                        setState(() {
                                          _password = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    CustomTextField(
                                      labelText: 'Confirm Password',
                                      inputType: TextInputType.visiblePassword,
                                      repeatPassword: _password,
                                    ),
                                    SizedBox(height: 40),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        textStyle: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        fixedSize: Size.fromWidth(200),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          FocusScope.of(context).unfocus();
                                          getIt<RegisterBloc>().add(
                                            RegisterEvent.register(
                                              RegisterUserModel(
                                                email: _email,
                                                password: _password,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Text("Register Account"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
            ),
      ),
    );
  }
}
