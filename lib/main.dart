import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Main: Firebase.initializeApp completed.');

    signalFirebaseReady();
  } catch (e) {
    print('Main: Firebase initialization failed: $e');
    signalFirebaseFailed(e);
  }
  // try {
  //   await FirebaseAppCheck.instance.activate(
  //     androidProvider: AndroidProvider.debug,
  //   );
  // } catch (e) {
  //   print('Error activating Firebase App Check: $e');
  //   // Handle activation error - your app might not work with backend services
  // }
  try {
    await setupServiceLocator(); // CRUCIAL
    print("Main: Service locator setup completed successfully.");
  } catch (e, s) {
    print("Main: Service locator setup FAILED: $e");
    print("Main: Stack Trace: $s");
    // Optionally: show an error screen instead of runApp if setup fails
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

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
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
      title: 'Flutter Demo',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
    );
  }
}
