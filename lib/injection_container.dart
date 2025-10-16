import 'package:get_it/get_it.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/data/data_sources/auth_remote.dart';
import 'package:jobdi/data/repositories/auth_repository.dart';
import 'package:jobdi/domain/usecases/auth/login_use_case.dart';
import 'package:jobdi/presentation/bloc/auth/auth_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator
    ..registerFactory(() => AuthBloc(locator()))
    ..registerFactory(ThemeBloc.new)
    ..registerFactory(AppBloc.new)
    // usecase
    ..registerLazySingleton(() => LoginUseCase(locator()))
    // repository
    ..registerLazySingleton<AuthRepository>(() => AuthRepoImppl(locator()))
    // data source
    ..registerLazySingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl.new,
    );
}
