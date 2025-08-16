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
        listenWhen:
            (previous, current) =>
                current.finishRegister || current.registrationFailed,
        listener: (context, state) {
          if (state.finishRegister)
            GoRouter.of(context).pushReplacement('/login');
          if (state.registrationFailed) {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('An unknown error occurred.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
            );
          }
        },
        builder:
            (context, state) => Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.primary,
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body:
                  state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  'Create Your Account',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        SizedBox(height: 20),
                                        CustomTextField(
                                          labelText: 'Password',
                                          inputType:
                                              TextInputType.visiblePassword,
                                          onChange: (value) {
                                            setState(() {
                                              _password = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        CustomTextField(
                                          labelText: 'Confirm Password',
                                          inputType:
                                              TextInputType.visiblePassword,
                                          repeatPassword: _password,
                                        ),
                                        SizedBox(height: 40),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 50,
                                              vertical: 15,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                    ?.validate() ??
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
                                          child: Text(
                                            "Register",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
      ),
    );
  }
}
