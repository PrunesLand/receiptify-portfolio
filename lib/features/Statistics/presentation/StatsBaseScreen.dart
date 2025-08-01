import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';
import 'package:receipt_app/features/Statistics/domain/index.dart';

import '../../../core/service_locator.dart';
import '../../Document/application/Document/index.dart';
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
              appBar: AppBar(
                title: Text(widget.args.pocket.title),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text('Your total expense'),
                              Text(
                                "\$${state.totalExpenseMain}",
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(flex: 6, child: DocumentWidget()),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Row(
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
                  SizedBox(width: 10), // Give some spacing between the buttons
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
    );
  }
}
