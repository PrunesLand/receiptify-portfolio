import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receipt_app/core/Storage/UserStorageRepository.dart';
import 'package:receipt_app/core/index.dart';
import 'package:receipt_app/features/Onboarding/index.dart';
import 'package:receipt_app/features/PocketGroup/application/index.dart';

import '../features/Document/Index.dart';

final getIt = GetIt.instance;

final Completer<void> _firebaseReadyCompleter = Completer<void>();
Future<void> get firebaseReadyFuture => _firebaseReadyCompleter.future;

void signalFirebaseReady() {
  if (!_firebaseReadyCompleter.isCompleted) {
    _firebaseReadyCompleter.complete();
    print('ServiceLocator: Firebase signaled as ready.');
  }
}

void signalFirebaseFailed(Object error) {
  if (!_firebaseReadyCompleter.isCompleted) {
    _firebaseReadyCompleter.completeError(error);
    print('ServiceLocator: Firebase signaled as FAILED.');
  }
}

void setupServiceLocator() async {
  getIt.registerSingleton<Future<void>>(
    firebaseReadyFuture,
    instanceName: 'firebaseReady',
  );
  getIt.registerLazySingleton(() => DocumentBloc());

  getIt.registerSingletonAsync<Isar>(() async {
    final dir = await getApplicationDocumentsDirectory();
    final isarInstance = await Isar.open(
      [UserSchema], // Add all your schemas
      directory: dir.path,
      name: "receiptAppDB",
    );
    print('ServiceLocator: Isar opened successfully.');
    return isarInstance;
  });

  await getIt.isReady<Isar>();
  print('ServiceLocator: Isar is ready.');

  getIt.registerLazySingleton(() => UserStorageRepository(getIt<Isar>()));
  final userStorageRepository = getIt<UserStorageRepository>();
  try {
    // This method should check if the user exists and create if not.
    User currentUser = await userStorageRepository.getOrCreateUser();
    print(
      'ServiceLocator: Single user check/creation complete. User ID: ${currentUser.id}, Name: ${currentUser.name}',
    );
  } catch (e) {
    print(
      'ServiceLocator: CRITICAL - Error during single user check/creation: $e',
    );
    // How you handle this is important.
    // For a single-user app, if the user record can't be ensured, the app might be unusable.
    // You might rethrow the error to be caught in main.dart to show an error screen.
    // For now, it logs and continues, but other services might fail if they expect a user.
    // Example: throw Exception("Failed to initialize core user data: $e");
  }

  getIt.registerLazySingleton(() => TokenStorageService());

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();

    dio.interceptors.add(AuthInterceptor(getIt<TokenStorageService>()));
    return dio;
  });

  getIt.registerLazySingleton(() => UserRepositoryService(getIt<Dio>()));

  getIt.registerLazySingleton(
    () => UserRepository(
      getIt<UserRepositoryService>(),
      getIt<TokenStorageService>(),
    ),
  );

  getIt.registerLazySingleton(() => DocumentRepositoryService(getIt<Dio>()));

  getIt.registerLazySingleton(
    () => DocumentRepository(getIt<DocumentRepositoryService>()),
  );

  getIt.registerLazySingleton(() => PocketBloc());
}
