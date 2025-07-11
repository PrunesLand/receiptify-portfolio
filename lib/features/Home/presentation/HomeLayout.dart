import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {
                GoRouter.of(context).push('/statistics');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Document'),
              onTap: () {
                GoRouter.of(context).push('/document');
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                GoRouter.of(context).go('/onboarding');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
