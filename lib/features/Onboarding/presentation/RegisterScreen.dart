import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Onboarding/presentation/Widgets/CustomTextField.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _email;
  String? _password;

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Center(child: Text('Register a new account')),
                    ),
                    Flexible(
                      flex: 6,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                labelText: 'First Name',
                                inputType: TextInputType.visiblePassword,
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                labelText: 'Last Name',
                                inputType: TextInputType.visiblePassword,
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                labelText: 'Email',
                                inputType: TextInputType.emailAddress,
                                regexPattern: RegExp(r'^[^@]+@[^@]+\.[^@]+'),
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
                                    borderRadius: BorderRadius.circular(8.0),
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
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    try {
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                            email: _email!,
                                            password: _password!,
                                          );
                                      if (mounted) {
                                        GoRouter.of(context).go('/home');
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text('Error: $e')),
                                        );
                                      }
                                    } finally {
                                      if (mounted) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    }
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
    );
  }
}
