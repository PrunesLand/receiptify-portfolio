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
  @override
  void initState() {
    super.initState();
    getIt<DocumentBloc>().add(DocumentEvent.loadSavedFiles());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<DocumentBloc, DocumentState>(
        builder:
            (context, state) => Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight + 20,
                  ), // Add space for AppBar and some padding
                  Flexible(
                    flex: 4, // Card takes 40% of the available space
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
                  Flexible(
                    flex: 6, // List takes 60% of the available space
                    child: DocumentWidget(),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ), // Adjust the bottom padding as needed
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
                      heroTag:
                          null, // Add heroTag to avoid conflicts if you have multiple FABs
                    ),
                    SizedBox(
                      width: 10,
                    ), // Give some spacing between the buttons
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
                      child: Icon(Icons.add_a_photo),
                      heroTag:
                          null, // Add heroTag to avoid conflicts if you have multiple FABs
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
