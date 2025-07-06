import 'dart:io';

import 'package:flutter/material.dart';

class FileSelectModal extends StatefulWidget {
  final File? file;
  final Function? onFileSelected;

  const FileSelectModal({super.key, this.file, this.onFileSelected});

  @override
  State<FileSelectModal> createState() => _FileSelectModalState();
}

class _FileSelectModalState extends State<FileSelectModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select File'),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            Text('Make sure the image is readable.'),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(widget.file!),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onFileSelected!();
          },
          child: Text('Scan'),
        ),
      ],
    );
  }
}
