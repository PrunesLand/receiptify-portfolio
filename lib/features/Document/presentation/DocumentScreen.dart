import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Document/presentation/widgets/FileSelectModal.dart';
import 'package:receipt_app/features/Document/presentation/widgets/Image_thumbnail.dart';
import 'package:receipt_app/main.dart';

import '../../../core/service_locator.dart';
import '../index.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: documentFBA(context),
      body: BlocBuilder<DocumentBloc, DocumentState>(
        builder:
            (context, state) => Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: state.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final itemId = state.list[index]!.id;
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Receipt Summary'),
                            content: SizedBox(
                              height: 350,
                              child: SingleChildScrollView(
                                child: Text(state.textData),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onLongPress: () {
                      HapticFeedback.heavyImpact();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Image'),
                            content: Text(
                              'Are you sure you want to delete this image?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  getIt<DocumentBloc>().add(
                                    DocumentEvent.removeImage(id: itemId),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      child: ImageThumbnail(file: state.list[index]?.file),
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }

  Widget documentFBA(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final image = await pickImageFromGallery();

        if (image != null) {
          showDialog(
            context: context,
            builder:
                (context) => FileSelectModal(
                  file: image,
                  onFileSelected: () {
                    Navigator.pop(context);
                    getIt<DocumentBloc>().add(
                      DocumentEvent.addImage(file: image),
                    );
                    getIt<DocumentBloc>().add(DocumentEvent.processImage());
                  },
                ),
          );
        } else {
          showErrorSnackBar();
        }
      },
      child: Icon(Icons.add),
    );
  }
}

void showErrorSnackBar() {
  final snackbar = SnackBar(
    content: Text('An error occurred while picking the image.'),
    duration: Duration(seconds: 2),
  );

  messengerKey.currentState?.showSnackBar(snackbar);
}
