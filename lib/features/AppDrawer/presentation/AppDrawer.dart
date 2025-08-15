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
    return WillPopScope(
      onWillPop: () async {
        // Prevent back navigation if the current route is /home
        return state.topRoute?.path != '/home';
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // Hide back button if the current route is /home
            automaticallyImplyLeading: state.topRoute?.path != '/home',
            actions: [
              if (state.topRoute?.path == '/selection')
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
              IconButton(
                icon: const Icon(Icons.bar_chart),
                onPressed: () {
                  GoRouter.of(context).push('/analytics');
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  GoRouter.of(context).push('/settings');
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const DrawerHeader(child: Text('Receipt App')),
                ListTile(
                  leading: const Icon(Icons.select_all),
                  title: const Text('Home'),
                  onTap: () {
                    GoRouter.of(context).pushReplacement('/home');
                    Future.delayed(const Duration(milliseconds: 150), () {
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.select_all),
                  title: const Text('Selection'),
                  onTap: () {
                    GoRouter.of(context).pushReplacement('/selection');
                    Future.delayed(const Duration(milliseconds: 150), () {
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: const Text('Subscription'),
                  onTap: () {
                    GoRouter.of(context).pushReplacement('/payment');
                    Future.delayed(const Duration(milliseconds: 150), () {
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
          body: child,
        ),
      ),
    );
  }
}
