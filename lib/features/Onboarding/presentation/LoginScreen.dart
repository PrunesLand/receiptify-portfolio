import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../Application/Login/login_bloc.dart';
import '../Application/Login/login_event.dart';
import '../Application/Login/login_state.dart';
import '../Domain/Models/LoginUserModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener:
            (context, state) => {
              if (state.finishLogin) GoRouter.of(context).replace('/home'),
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
                      ? CircularProgressIndicator()
                      : Column(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Center(child: Text('Login to your account')),
                          ),
                          Flexible(
                            flex: 4,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        final emailRegex = RegExp(
                                          r'^[^@]+@[^@]+\.[^@]+',
                                        );
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => _email = value ?? '',
                                    ),
                                  ),
                                  SizedBox(height: 24.0),
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      onSaved:
                                          (value) => _password = value ?? '',
                                    ),
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
                                        _formKey.currentState?.save();
                                        FocusScope.of(context).unfocus();
                                        getIt<LoginBloc>().add(
                                          LoginEvent.loginUser(
                                            LoginUserModel(
                                              email: _email,
                                              password: _password,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text("Login"),
                                  ),
                                ],
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
