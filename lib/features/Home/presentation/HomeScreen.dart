import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Home/presentation/widgets/FileSelectModal.dart';
import 'package:receipt_app/features/Home/presentation/widgets/Image_thumbnail.dart';
import 'package:receipt_app/main.dart';

import '../../../core/service_locator.dart';
import '../index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: getIt<HomeBloc>(),
      builder:
          (context, state) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final image = await pickImageFromGallery();

                if (image != null) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => FileSelectModal(
                          file: image,
                          onFileSelected: () {
                            getIt<HomeBloc>().add(
                              HomeEvent.addImage(
                                fileName: 'test name',
                                filePath: image.path,
                              ),
                            );
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                  );
                } else {
                  showErrorSnackBar();
                }
              },
              child: Icon(Icons.add),
            ),
            body: Padding(
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
                  return Card(
                    child: ImageThumbnail(file: state.list[index]?.file),
                  );
                },
              ),
            ),
          ),
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
