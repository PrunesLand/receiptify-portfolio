import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Document/Index.dart';
import 'package:receipt_app/features/Onboarding/presentation/RegisterScreen.dart';
import 'package:receipt_app/features/Statistics/presentation/StatsBaseScreen.dart';

import 'core/service_locator.dart';
import 'features/CameraOCR/presentation/CameraScreen.dart';
import 'features/Home/presentation/HomeLayout.dart';
import 'features/Onboarding/presentation/HeroScreen.dart';
import 'features/Onboarding/presentation/LoginScreen.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/statistics',
          builder: (BuildContext, GoRouterState state) {
            return const StatsBaseScreen();
          },
        ),
        GoRoute(
          path: '/document',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => getIt<DocumentBloc>(),
              child: DocumentScreen(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/camera',
      builder: (BuildContext context, GoRouterState state) {
        return const CameraScreen();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const HeroScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: messengerKey,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
