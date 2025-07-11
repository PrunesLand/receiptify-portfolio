import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Onboarding/presentation/Widgets/CustomTextField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

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
        body: Column(
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
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Password',
                        inputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Confirm Password',
                        inputType: TextInputType.visiblePassword,
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
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registering account...')),
                            );
                            GoRouter.of(context).go('/document');
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
