import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Statistics/domain/index.dart';

import '../../../core/service_locator.dart';
import '../../Document/application/Document/index.dart';
import '../../Document/domain/models/Receipt/ReceiptModel.dart';
import '../../Document/presentation/widgets/DocumentWidget.dart';
import '../../Document/presentation/widgets/FileSelectModal.dart';
import '../../Document/utils.dart';

class StatsBaseScreen extends StatefulWidget {
  final BasicStats args;
  const StatsBaseScreen({super.key, required this.args});

  @override
  State<StatsBaseScreen> createState() => _StatsBaseScreenState();
}

class _StatsBaseScreenState extends State<StatsBaseScreen> {
  final String uniqueId = UniqueKey().toString();

  @override
  void initState() {
    super.initState();
    getIt<DocumentBloc>().add(DocumentEvent.loadSavedFiles());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: BlocBuilder<DocumentBloc, DocumentState>(
          builder:
              (context, state) => Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: kToolbarHeight + 20),
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.args.pocket.title,
                                        style: TextStyle(fontSize: 40),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20),
                                      Text('Your total expense'),
                                      Text(
                                        "\$${state.totalExpenseMain}",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(flex: 6, child: DocumentWidget()),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () async {
                          final result = await GoRouter.of(
                            context,
                          ).push<ReceiptModel?>('/newItemForm');

                          if (result != null) {
                            getIt<DocumentBloc>().add(
                              DocumentEvent.addNewReceipt(result),
                            );
                          }
                        },
                        child: Icon(Icons.add_box_rounded),
                        heroTag: 'add_new_receipt_$uniqueId',
                      ),
                      SizedBox(width: 10),
                      FloatingActionButton.extended(
                        onPressed:
                            state.OcrLoading || state.remainingRequests == 0
                                ? null
                                : () async {
                                    final image = await pickImageFromGallery();
                                    if (image != null) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => FileSelectModal(
                                          file: image,
                                          onFileSelected: () {
                                            Navigator.pop(context);
                                            getIt<DocumentBloc>().add(
                                              DocumentEvent.processImage(
                                                file: image,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      showErrorSnackBar();
                                    }
                                  },
                        label: Text(
                          "${state.remainingRequests}/${state.totalRequests}",
                        ),
                        icon: state.OcrLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Icon(Icons.add_a_photo),
                        backgroundColor:
                            state.OcrLoading || state.remainingRequests == 0
                                ? Colors.grey
                                : Theme.of(context).colorScheme.secondary,
                        heroTag: 'scan_receipt_ocr_$uniqueId',
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
