import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/data/datasources/album_remote_datasource.dart';
import 'package:flutter_assignment/data/repositories/album_repository_impl.dart';
import 'package:flutter_assignment/domain/repositories/album_repository.dart';
import 'package:flutter_assignment/domain/usecases/get_albums.dart';
import 'package:flutter_assignment/presentation/blocs/album_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl())); // SECOND

  // Data Layer
  sl.registerLazySingleton<AlbumRemoteDataSource>(
    () => AlbumRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetAlbums(sl()));
  // sl.registerLazySingleton(() => GetPhotos(sl()));

  // Bloc
  sl.registerFactory(() => AlbumBloc(sl()));
}
