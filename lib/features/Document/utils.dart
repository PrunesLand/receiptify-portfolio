import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image != null ? File(image.path) : null;
}

Future<String> TextRecognitionEngine(File file) async {
  // final InputImage inputImage;
  //
  // inputImage = InputImage.fromFile(file);
  //
  // final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  //
  // final RecognizedText recognizedText = await textRecognizer.processImage(
  //   inputImage,
  // );
  //
  // String text = recognizedText.text;
  // print('Recognized text: $text');
  //
  // textRecognizer.close();

  return 'sample text from image'; // Placeholder for actual text recognition logic
}
