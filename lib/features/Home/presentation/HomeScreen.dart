import 'package:flutter/material.dart';
import 'package:receipt_app/features/Home/Index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await pickImageFromGallery();

          if (image != null) {
            print("PRUNE IMAGE SELECTED: ${image.path}");
          }
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return Card(child: Center(child: Text('Item $index')));
          },
        ),
      ),
    );
  }
}
