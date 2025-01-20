import 'package:elabasy_store/core/app/cubit/app_cubit.dart';
import 'package:elabasy_store/core/services/graphql/api_service.dart';
import 'package:elabasy_store/core/services/graphql/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio));
}
