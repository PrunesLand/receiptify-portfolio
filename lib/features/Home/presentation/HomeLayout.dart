import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../PocketGroup/application/index.dart';
import '../../PocketGroup/domain/index.dart';
import '../../PocketGroup/presentation/widgets/Modal.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  final GoRouterState state;
  const HomeLayout({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    print("PRUNE ${state.topRoute?.path}");
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
              title: Text('Selection'),
              onTap: () {
                GoRouter.of(context).push('/selection');
              },
            ),
            ListTile(
              leading: Icon(Icons.select_all),
              title: Text('Settings'),
              onTap: () {
                GoRouter.of(context).push('/settings');
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
