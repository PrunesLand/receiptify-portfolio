import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';

import 'Schema/User.dart';

Future<ReceiptModel> mapDocumentToImageModel(Document isarDocument) async {
  File? imageFile;

  if (isarDocument.image != null && isarDocument.image!.isNotEmpty) {
    // 1. Get a temporary directory to save the file
    final tempDir = await getTemporaryDirectory();

    // 2. Create a file path. Use fileName if available and unique, otherwise generate one.
    // Ensure the fileName is safe to use as a file path.
    String effectiveFileName =
        isarDocument.fileName.isNotEmpty
            ? isarDocument.fileName
            : 'temp_image_${DateTime.now().millisecondsSinceEpoch}.jpg'; // Or a more appropriate extension

    // Sanitize fileName if it comes from user input or external sources to prevent path traversal issues.
    // For simplicity here, we'll assume fileName is relatively safe or you'll add sanitization.
    effectiveFileName = effectiveFileName.replaceAll(
      RegExp(r'[^\w\.-]'),
      '_',
    ); // Basic sanitization

    final filePath = '${tempDir.path}/$effectiveFileName';
    imageFile = File(filePath);

    final Uint8List imageBytes = Uint8List.fromList(isarDocument.image!);

    // 4. Write the bytes to the file
    await imageFile.writeAsBytes(imageBytes);
  }

  // Assuming you want to use isarDocument.fileName as the ID for ImageModel.
  // Adjust if your ID logic is different.
  // Also, you might want to map `totalExpense` to `content` or another field
  // if it makes sense for your `ImageModel`.
  return ReceiptModel(
    id: isarDocument.fileName, // Or another unique identifier from Document
    file: imageFile,
    cost: isarDocument.totalExpense, // Example: mapping totalExpense to content
  );
}

Future<List<ReceiptModel>> mapDocumentsToImageModels(
  List<Document> documents,
) async {
  return Future.wait(documents.map((doc) => mapDocumentToImageModel(doc)));
}
