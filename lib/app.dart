import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:receipt_app/core/theme_data.dart';
import 'package:receipt_app/features/Document/index.dart';
import 'package:receipt_app/features/Onboarding/Application/index.dart';
import 'package:receipt_app/features/Onboarding/presentation/RegisterScreen.dart';
import 'package:receipt_app/features/Payment/index.dart';
import 'package:receipt_app/features/PocketGroup/application/index.dart';
import 'package:receipt_app/features/PocketGroup/domain/index.dart';
import 'package:receipt_app/features/PocketGroup/presentation/DataSelectionScreen.dart';
import 'package:receipt_app/features/Settings/index.dart';
import 'package:receipt_app/features/Statistics/index.dart';

import 'core/service_locator.dart';
import 'core/theme_provider.dart';
import 'features/AppDrawer/presentation/AppDrawer.dart';
import 'features/CameraOCR/presentation/CameraScreen.dart';
import 'features/Document/presentation/widgets/NewItemFormScreen.dart';
import 'features/Onboarding/presentation/HeroScreen.dart';
import 'features/Onboarding/presentation/LoginScreen.dart';
import 'features/Statistics/application/Statistics/statistics_bloc.dart';
import 'firebase_options.dart';

void main() async {
  final logger = Logger();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    logger.i('Main: Firebase.initializeApp completed.');
    signalFirebaseReady();
  } catch (e) {
    logger.e('Main: Firebase initialization failed: $e');
    signalFirebaseFailed(e);
  }
  try {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );
  } catch (e) {
    logger.e('Firebase App Check activation failed: $e');
  }
  try {
    await setupServiceLocator();
    logger.i("Main: Service locator setup completed successfully.");
  } catch (e, s) {
    logger.e("Main: Service locator setup FAILED: $e");
    logger.e("Main: Stack Trace: $s");
    return;
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

// Define the router outside of the main function or inside a class
// to avoid re-creating it on every build.
final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  redirect: (BuildContext context, GoRouterState state) {
    final bool loggedIn = FirebaseAuth.instance.currentUser != null;
    final String location = state.uri.toString();

    // Define routes that are accessible without being logged in
    final bool isPublicRoute =
        location == '/onboarding' ||
        location == '/login' ||
        location == '/register';

    // If the user is logged in and tries to access a public-only route
    // (like login or register), redirect them to the home screen.
    if (loggedIn && isPublicRoute) {
      return '/home';
    }

    // No redirection needed
    return null;
  },
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<PocketBloc>()),
            BlocProvider.value(value: getIt<DocumentBloc>()),
          ],
          child: AppDrawer(child: child, state: state),
        );
      },
      routes: [
        GoRoute(
          path: '/selection',
          builder: (BuildContext context, GoRouterState state) {
            return DataSelectionScreen();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (BuildContext, GoRouterState state) {
            return StatsBaseScreen(
              args: BasicStats(
                summaryExpense: '6000',
                pocket: PocketModel(
                  title: 'Main',
                  totalExpense: '5000',
                  totalBudget: '5000',
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '/newItemForm',
          builder: (BuildContext context, GoRouterState state) {
            return NewItemFormScreen();
          },
        ),
        GoRoute(
          path: '/payment',
          builder: (BuildContext context, GoRouterState state) {
            return PaymentScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return SettingsScreen();
      },
    ),
    GoRoute(
      path: '/about',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutScreen();
      },
    ),
    GoRoute(
      path: '/analytics',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: getIt<StatisticsBloc>(),
          child: StatsDataScreen(),
        );
      },
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
        return BlocProvider.value(
          value: getIt<LoginBloc>(),
          child: LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: getIt<RegisterBloc>(),
          child: RegisterScreen(),
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      scaffoldMessengerKey: messengerKey,
      routerConfig: router,
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
    );
  }
}
