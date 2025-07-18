import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Document/presentation/widgets/FileSelectModal.dart';
import 'package:receipt_app/features/Document/presentation/widgets/Image_thumbnail.dart';
import 'package:receipt_app/main.dart';

import '../../../../core/service_locator.dart';
import '../../index.dart';
import 'DocumentCard.dart';

class DocumentWidget extends StatefulWidget {
  const DocumentWidget({super.key});

  @override
  State<DocumentWidget> createState() => _DocumentWidgetState();
}

class _DocumentWidgetState extends State<DocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(
      builder:
          (context, state) => GridView.builder(
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
                child: DocumentCard(),
              );
            },
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
