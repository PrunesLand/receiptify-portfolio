import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Home/Index.dart';

import 'features/CameraOCR/presentation/CameraScreen.dart';

void main() {
  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/camera',
      builder: (BuildContext context, GoRouterState state) {
        return const CameraScreen();
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
