import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ai/firebase_ai.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image != null ? File(image.path) : null;
}

Future<String> TextRecognitionEngine(File file) async {
  if (Firebase.apps.isNotEmpty) {
    print('[Bloc] Firebase IS initialized. Default app: ${Firebase.app().name}');
  } else {
    print('[Bloc] Firebase IS NOT initialized here!');
    // If this prints, then something de-initialized Firebase or this code path is hit unexpectedly.
    throw Exception("Firebase not initialized before GenerativeModel call in Bloc");
  }

    final generationConfig = GenerationConfig(
      responseMimeType: 'text/plain',
    );
    final GenerativeModel model;
    try {

      model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
        generationConfig: generationConfig,
      );
    } catch (e){
      throw Exception("PRUNE MODEL ${e.toString()}");
    }
    // Provide a text prompt to include with the image
    final prompt = TextPart("What's in the picture?");
// Prepare images for input
    final imagePart = InlineDataPart('image/jpeg', file.readAsBytesSync());

// To generate text output, call generateContent with the text and image
  try {
    final response = await model.generateContent([
      Content.multi([prompt, imagePart])
    ]);
    return response.text ?? 'There was an issue with the analysis';
  }catch (e){
    print("PRUNE TEXT ${e.toString()}");
  }
    return 'Error';
}
