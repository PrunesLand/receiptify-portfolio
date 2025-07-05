import 'package:flutter/material.dart';

class FileSelectModal extends StatefulWidget {
  const FileSelectModal({super.key});

  @override
  State<FileSelectModal> createState() => _FileSelectModalState();
}

class _FileSelectModalState extends State<FileSelectModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select File'),
      content: Text('This is where you would implement file selection logic.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
