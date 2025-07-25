import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  final bool isLoading;
  final String? text;
  const DocumentCard({super.key, this.isLoading = false, this.text});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text ?? 'No Text'),
                  // Text('\$XXX'),
                  // Text(DateFormat('d/M/y').format(date)),
                ],
              ),
            ),
          ),
        );
  }
}
