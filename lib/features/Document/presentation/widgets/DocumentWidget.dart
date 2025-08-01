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
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    ChoiceChip(
                      label: Text('Highest'),
                      selected: state.chipEnum == DocumentChipEnum.highest,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      onSelected: (selected) {
                        if (selected) {
                          getIt<DocumentBloc>().add(
                            DocumentEvent.chipSelect(DocumentChipEnum.highest),
                          );
                        }
                      },
                    ),
                    SizedBox(width: 8.0),
                    ChoiceChip(
                      label: Text('Lowest'),
                      selected: state.chipEnum == DocumentChipEnum.lowest,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,

                      onSelected: (selected) {
                        if (selected) {
                          getIt<DocumentBloc>().add(
                            DocumentEvent.chipSelect(DocumentChipEnum.lowest),
                          );
                        }
                      },
                    ),
                    SizedBox(width: 8.0),
                    ChoiceChip(
                      label: Text('Latest'),
                      selected: state.chipEnum == DocumentChipEnum.latest,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      onSelected: (selected) {
                        if (selected) {
                          getIt<DocumentBloc>().add(
                            DocumentEvent.chipSelect(DocumentChipEnum.latest),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 300),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    final itemId = item!.id;

                    return GestureDetector(
                      onTap: () {
                        if (!(index == 0 && state.OcrLoading)) {
                          showModalBottomSheet<void>(
                            context: context,
                            builder:
                                (context) => ItemSelectSheet(
                                  title: 'Receipt Summary',
                                  description: item.cost,
                                  thumbnail: item.file,
                                  receiptDate: item.receiptDate?.toString(),
                                ),
                          );
                        }
                      },
                      onLongPress: () {
                        if (!(index == 0 && state.OcrLoading)) {
                          HapticFeedback.heavyImpact();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DocumentDeleteDialog(
                                onFileSelected: () {
                                  Navigator.of(context).pop();
                                  getIt<DocumentBloc>().add(
                                    DocumentEvent.removeImage(id: itemId),
                                  );
                                },
                              );
                            },
                          );
                        }
                      },
                      child:
                          index == 0
                              ? DocumentCard(
                                isLoading: state.OcrLoading,
                                text: item.cost,
                              )
                              : DocumentCard(text: item.cost),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget documentFBA(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('NewItemFromScreen button pressed')),
            );
          },
          child: Icon(Icons.add_a_photo),
          heroTag: null,
        ),
        SizedBox(width: 10),
        FloatingActionButton(
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
                          DocumentEvent.processImage(file: image),
                        );
                      },
                    ),
              );
            } else {
              showErrorSnackBar();
            }
          },
          child: Icon(Icons.add),
          heroTag: null,
        ),
      ],
    );
  }
}

void showErrorSnackBar() {
  final snackbar = SnackBar(
    content: Text(
      'An error occurred while picking the image or NewItemFromScreen is not implemented.',
    ),
    duration: Duration(seconds: 2),
  );

  messengerKey.currentState?.showSnackBar(snackbar);
}
