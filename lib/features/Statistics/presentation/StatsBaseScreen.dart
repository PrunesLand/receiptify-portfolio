import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Statistics/domain/index.dart';

import '../../../core/service_locator.dart';
import '../../Document/application/Document/index.dart';
import '../../Document/presentation/widgets/DocumentWidget.dart';
import '../../Document/presentation/widgets/FileSelectModal.dart';
import '../../Document/utils.dart';

class StatsBaseScreen extends StatelessWidget {
  final BasicStats args;
  const StatsBaseScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(title: Text(args.pocket.title), centerTitle: true),
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
                            Text('Your total budget'),
                            Text(
                              state.totalExpenseMain,
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
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
                                          getIt<DocumentBloc>().add(
                                            DocumentEvent.processImage(),
                                          );
                                        },
                                      ),
                                );
                              } else {
                                showErrorSnackBar();
                              }
                            },
                            child: Text('Add Document'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(flex: 6, child: DocumentWidget()),
              ],
            ),
          ),
    );
  }
}
