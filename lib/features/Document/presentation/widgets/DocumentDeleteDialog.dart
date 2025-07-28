import 'package:flutter/material.dart';

class DocumentDeleteDialog extends StatelessWidget {
  final Function? onFileSelected;
  const DocumentDeleteDialog({super.key, this.onFileSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete document'),
      content: SizedBox(
        height: 50,
        child: Column(
          children: [
            Center(child: Text('Are you sure you want to delete this item?')),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onFileSelected!();
          },
          child: Text('Delete'),
        ),
      ],
    );
  }
}
