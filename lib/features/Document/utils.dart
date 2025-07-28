import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/models/Image/ImageModel.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image != null ? File(image.path) : null;
}

Future<File> saveImageToMainPocketDirectory(File file, String fileName) async {
  File fileToStore;
  final appDocDir = await getApplicationDocumentsDirectory();
  // Ensure the MainPocket directory exists
  final mainPocketDir = Directory('${appDocDir.path}/MainPocket');
  if (!await mainPocketDir.exists()) {
    await mainPocketDir.create(recursive: true);
  }

  final newFilePath = '${mainPocketDir.path}/$fileName';

  final Uint8List? compressedBytes = await compressImage(file);
  if (compressedBytes != null) {
    fileToStore = await File(newFilePath).writeAsBytes(compressedBytes);
  } else {
    // If compression fails or returns null, copy the original file
    fileToStore = await file.copy(newFilePath);
  }
  return fileToStore;
}

Future<File?> getImageFromMainPocketDirectory(String fileName) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final file = File('${appDocDir.path}/MainPocket/$fileName');
  if (await file.exists()) {
    return file;
  }
  return null;
}

Future<File> saveImageToSubPocketDirectory(
  Uint8List imageBytes,
  String fileName,
  String pocketName,
) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final file = File('${appDocDir.path}/$pocketName/$fileName');
  await file.writeAsBytes(imageBytes);
  return file;
}

Future<File?> getImageFromSubPocketDirectory(
  String fileName,
  String pocketName,
) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final file = File('${appDocDir.path}/$pocketName/$fileName');
  if (await file.exists()) {
    return file;
  }
  return null;
}

Future<void> saveImageModel(ImageModel modelInstance, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName.json'); // Save as a .json file

  // Important: If ImageModel contains a File object, you should serialize
  // the file's PATH, not the File object itself.
  // Map<String, dynamic> modelJson = modelInstance.toJson(); // Assuming ImageModel has toJson()
  //
  // String jsonString = jsonEncode(modelJson);
  // await file.writeAsString(jsonString);
  // print('Saved model to: ${file.path}');
}

Future<Uint8List?> compressImage(File file) async {
  final compressedFile = await FlutterImageCompress.compressWithFile(
    // ignore: cascade_invocations
    file.absolute.path,
    quality: 70,
    minWidth: 1280,
    minHeight: 1024,
    format: CompressFormat.jpeg,
  );

  return compressedFile;
}

// Future<String> TextRecognitionEngine(File file) async {
//   if (Firebase.apps.isNotEmpty) {
//     print('[Bloc] Firebase IS initialized. Default app: ${Firebase.app().name}');
//   } else {
//     print('[Bloc] Firebase IS NOT initialized here!');
//     // If this prints, then something de-initialized Firebase or this code path is hit unexpectedly.
//     throw Exception("Firebase not initialized before GenerativeModel call in Bloc");
//   }
//
//     final generationConfig = GenerationConfig(
//       responseMimeType: 'text/plain',
//     );
//     final GenerativeModel model;
//     try {
//
//       model = FirebaseAI.googleAI().generativeModel(
//         model: 'gemini-2.5-flash',
//         generationConfig: generationConfig,
//       );
//     } catch (e){
//       throw Exception("PRUNE MODEL ${e.toString()}");
//     }
//     // Provide a text prompt to include with the image
//     final prompt = TextPart("What's in the picture?");
// // Prepare images for input
//     final imagePart = InlineDataPart('image/jpeg', file.readAsBytesSync());
//
// // To generate text output, call generateContent with the text and image
//   try {
//     final response = await model.generateContent([
//       Content.multi([prompt, imagePart])
//     ]);
//     return response.text ?? 'There was an issue with the analysis';
//   }catch (e){
//     print("PRUNE TEXT ${e.toString()}");
//   }
//     return 'Error';
// }
