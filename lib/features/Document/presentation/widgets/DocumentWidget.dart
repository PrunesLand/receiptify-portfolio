import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/main.dart';

import '../../../../core/service_locator.dart';
import '../../index.dart';
import 'index.dart';

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
                  // Allow click if it's not the first item while loading,
                  // or if it's any item and not loading.
                  if (!(index == 0 && state.OcrLoading)) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Receipt Summary'),
                          content: SizedBox(
                            height: 350,
                            child: SingleChildScrollView(
                              child: Text(state.list[index]!.content),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                onLongPress: () {
                  // Allow long press if it's not the first item while loading,
                  // or if it's any item and not loading.
                  if (!(index == 0 && state.OcrLoading)) {
                    HapticFeedback.heavyImpact();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DocumentDeleteDialog(
                          onFileSelected:
                              () => getIt<DocumentBloc>().add(
                                DocumentEvent.removeImage(id: itemId),
                              ),
                        );
                      },
                    );
                  }
                },
                child:
                    index == 0
                        ? DocumentCard(
                          isLoading: state.OcrLoading,
                          text: index.toString(),
                        )
                        : DocumentCard(text: index.toString()),
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
