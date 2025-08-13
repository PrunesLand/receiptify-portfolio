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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocBuilder<DocumentBloc, DocumentState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                      selectedColor: colorScheme.primaryContainer,
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
                      selectedColor: colorScheme.primaryContainer,
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
                      selectedColor: colorScheme.primaryContainer,
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
              if (state.OcrLoading && state.list.isEmpty)
                TileWidget(isLoading: true)
              // --- EDITED SECTION ---
              // This is the improved empty state widget.
              else if (state.list.isEmpty)
                Expanded(
                  // 1. Expanded makes this section fill the available vertical space.
                  child: Center(
                    // 2. Center then perfectly centers its child within that space.
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        // 3. A Column is used to stack an icon and text vertically.
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 64,
                            color: colorScheme.onSurface.withOpacity(0.4),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No receipts yet!\nTap the "+" button to add your first one.',
                            textAlign: TextAlign.center,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.6),
                              height: 1.5, // Improves line spacing
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              // --- END OF EDITED SECTION ---
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    physics: const ClampingScrollPhysics(),
                    itemCount:
                        state.OcrLoading
                            ? state.list.length + 1
                            : state.list.length,
                    itemBuilder: (context, index) {
                      if (state.OcrLoading && index == 0) {
                        return TileWidget(isLoading: true);
                      }

                      final itemIndex = state.OcrLoading ? index - 1 : index;
                      final item = state.list[itemIndex];
                      final itemId = item!.id;

                      return GestureDetector(
                        onTap: () {
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
                        },
                        onLongPress: () {
                          HapticFeedback.heavyImpact();
                          showDialog<void>(
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
                        },
                        child: TileWidget(
                          cost: item.cost,
                          dateOfReceipt: item.receiptDate,
                          category: item.category,
                        ),
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
