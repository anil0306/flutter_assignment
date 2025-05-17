import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/data/datasources/album_remote_datasource.dart';
import 'package:flutter_assignment/data/repositories/album_repository_impl.dart';
import 'package:flutter_assignment/domain/repositories/album_repository.dart';
import 'package:flutter_assignment/domain/usecases/get_albums.dart';
import 'package:flutter_assignment/domain/usecases/get_photos.dart';
import 'package:flutter_assignment/presentation/bloc/album_bloc/album_bloc.dart';
import 'package:flutter_assignment/presentation/bloc/photo_bloc/photo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // Data Layer
  sl.registerLazySingleton<AlbumRemoteDataSource>(
    () => AlbumRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetAlbums(sl()));
  sl.registerLazySingleton(() => GetPhotos(sl()));

  // Bloc
  sl.registerFactory(() => AlbumBloc(sl()));
  sl.registerFactory(() => PhotoBloc(sl()));
}
