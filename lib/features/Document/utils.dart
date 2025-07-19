import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_ai/firebase_ai.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image != null ? File(image.path) : null;
}

Future<String> TextRecognitionEngine(File file) async {

    final generationConfig = GenerationConfig(
      responseMimeType: 'text/plain',
    );

    final model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-2.5-flash',
      generationConfig: generationConfig,
    );
    // Provide a text prompt to include with the image
    final prompt = TextPart("What's in the picture?");
// Prepare images for input
    final imagePart = InlineDataPart('image/jpeg', file.readAsBytesSync());

// To generate text output, call generateContent with the text and image
    final response = await model.generateContent([
      Content.multi([prompt,imagePart])
    ]);
    return response.text ?? 'There was an issue with the analysis';
}
