import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDependencies() {
  // Register Dio
  // Register ApiService
  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
  );
  sl.registerLazySingleton(() => ApiService(sl()));
}
