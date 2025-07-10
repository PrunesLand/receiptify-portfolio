import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Receipt App'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.data_thresholding_outlined),
                title: Text('Statistics'),
                onTap: () {},
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
                onTap: () {},
              ),
            ],
          ),
        ),
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
                        Navigator.pop(context);
                        getIt<HomeBloc>().add(HomeEvent.addImage(file: image));
                        getIt<HomeBloc>().add(HomeEvent.processImage());
                      },
                    ),
              );
            } else {
              showErrorSnackBar();
            }
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder:
              (context, state) => Padding(
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
                                    getIt<HomeBloc>().add(
                                      HomeEvent.removeImage(id: itemId),
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
                      child: Card(
                        child: ImageThumbnail(file: state.list[index]?.file),
                      ),
                    );
                  },
                ),
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
