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
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 1. Removed the Flexible widget from here.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
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
              // 2. Changed Flexible to Expanded.
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // ✅ This is the correct property to stop the overscroll effect.
                  physics: const ClampingScrollPhysics(),
                  itemCount: state.list.length,
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
                              ? TileWidget(
                                title: item.cost,
                                isLoading: state.OcrLoading,
                              )
                              : TileWidget(title: item.cost),
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
