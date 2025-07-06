import 'package:get_it/get_it.dart';

import '../features/Home/application/Home/home_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => HomeBloc());
}
