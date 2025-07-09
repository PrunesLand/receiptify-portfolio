import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final RegExp? regexPattern;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.inputType,
    this.regexPattern,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $labelText';
          }
          if (regexPattern != null) {
            final emailRegex = regexPattern;
            if (!emailRegex!.hasMatch(value)) {
              return 'Please enter a valid $labelText';
            }
          }
          return null;
        },
      ),
    );
  }
}
