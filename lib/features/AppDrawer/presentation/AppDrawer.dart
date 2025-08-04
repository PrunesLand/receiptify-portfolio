import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../PocketGroup/application/index.dart';
import '../../PocketGroup/domain/index.dart';
import '../../PocketGroup/presentation/widgets/Modal.dart';

class AppDrawer extends StatelessWidget {
  final Widget child;
  final GoRouterState state;
  const AppDrawer({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions:
            state.topRoute?.path == '/selection'
                ? [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      final result = await showDialog<PocketModel>(
                        context: context,
                        builder: (context) => BudgetModal(),
                      );
                      if (result != null) {
                        getIt<PocketBloc>().add(PocketEvent.addPocket(result));
                      }
                    },
                  ),
                ]
                : null,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Receipt App'),
            ),
            ListTile(
              leading: Icon(Icons.select_all),
              title: Text('Home'),
              onTap: () {
                GoRouter.of(context).pushReplacement('/home');
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.select_all),
              title: Text('Selection'),
              onTap: () {
                GoRouter.of(context).pushReplacement('/selection');
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Subscription'),
              onTap: () {
                GoRouter.of(context).pushReplacement('/payment');
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.pop(context);
                });
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                GoRouter.of(context).go('/settings');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
