import 'dart:io';

import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  final File? file;
  const ImageThumbnail({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(fit: BoxFit.cover, image: FileImage(file!)),
      ),
    );
  }
}
