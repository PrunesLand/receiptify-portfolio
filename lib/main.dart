import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/Document/Index.dart';
import 'package:receipt_app/features/Onboarding/presentation/RegisterScreen.dart';
import 'package:receipt_app/features/PocketGroup/application/index.dart';
import 'package:receipt_app/features/PocketGroup/presentation/DataSelectionScreen.dart';
import 'package:receipt_app/features/Settings/index.dart';
import 'package:receipt_app/features/Statistics/presentation/StatsBaseScreen.dart';

import 'core/service_locator.dart';
import 'features/CameraOCR/presentation/CameraScreen.dart';
import 'features/Home/presentation/HomeLayout.dart';
import 'features/Onboarding/presentation/HeroScreen.dart';
import 'features/Onboarding/presentation/LoginScreen.dart';
import 'features/Statistics/domain/Models/BasicStats.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Main: Firebase.initializeApp completed.');

    signalFirebaseReady(); // Signal from service_locator.dart
  } catch (e) {
    print('Main: Firebase initialization failed: $e');
    signalFirebaseFailed(e); // Signal failure
    // You might want to show an error UI and not proceed
  }
  try {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );
  } catch (e) {
    print('Error activating Firebase App Check: $e');
    // Handle activation error - your app might not work with backend services
  }
  setupServiceLocator();
  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

final GoRouter router = GoRouter(
  initialLocation: kDebugMode ? '/settings' : '/onboarding',
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<PocketBloc>())],
          child: HomeLayout(child: child, state: state),
        );
      },
      routes: [
        GoRoute(
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) {
            return SettingsScreen();
          },
        ),
        GoRoute(
          path: '/selection',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => getIt<PocketBloc>(),
              child: DataSelectionScreen(),
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: '/statistics',
      builder: (BuildContext, GoRouterState state) {
        final args = state.extra as BasicStats;
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<DocumentBloc>())],
          child: StatsBaseScreen(args: args),
        );
      },
    ),
    GoRoute(
      path: '/document',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<DocumentBloc>(),
          child: DocumentWidget(),
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
