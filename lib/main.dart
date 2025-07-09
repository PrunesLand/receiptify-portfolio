import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Home/Index.dart';
import 'package:receipt_app/features/Onboarding/presentation/RegisterScreen.dart';

import 'core/service_locator.dart';
import 'features/CameraOCR/presentation/CameraScreen.dart';
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
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<HomeBloc>(),
          child: HomeScreen(),
        );
      },
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
