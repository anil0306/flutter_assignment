import 'package:flutter_assignment/data/datasources/album_remote_datasource.dart';
import 'package:flutter_assignment/data/models/photo_model.dart';
import 'package:flutter_assignment/domain/entities/album.dart';
import 'package:flutter_assignment/domain/repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;

  AlbumRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Album>> getAlbums() async {
    return await remoteDataSource.getAlbums();
  }

  @override
  Future<List<PhotoModel>> getPhotos(int albumId) async {
    return await remoteDataSource.getPhotos(albumId);
  }
}
