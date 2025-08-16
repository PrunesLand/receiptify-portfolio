import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('App Name'),
            subtitle: Text('Receipt App'),
          ),
          ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0+1'),
          ),
          ListTile(
            title: Text('Author'),
            subtitle: Text('The Receipt App Team'),
          ),
        ],
      ),
    );
  }
}
