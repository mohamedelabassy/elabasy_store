import 'package:elabasy_store/core/app/cubit/app_cubit.dart';
import 'package:elabasy_store/core/services/graphql/api_service.dart';
import 'package:elabasy_store/core/services/graphql/dio_factory.dart';
import 'package:elabasy_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:elabasy_store/features/auth/data/repos/auth_repo.dart';
import 'package:elabasy_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigateKey = GlobalKey<NavigatorState>();

  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigateKey);
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
