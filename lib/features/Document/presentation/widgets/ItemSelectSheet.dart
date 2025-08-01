import 'dart:io';

import 'package:flutter/material.dart';

class ItemSelectSheet extends StatelessWidget {
  final String title;
  final String description;
  final File? thumbnail;
  final String? receiptDate;

  const ItemSelectSheet({
    super.key,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.receiptDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8.0),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            receiptDate ?? 'Date not recorded',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (thumbnail != null)
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(thumbnail!),
                ),
              ),
            )
          else
            const Text(
              'No image',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}
