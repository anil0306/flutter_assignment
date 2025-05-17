import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/data/models/album_model.dart';

abstract class AlbumRemoteDataSource {
  Future<List<AlbumModel>> getAlbums();
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final ApiService apiService;

  AlbumRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<AlbumModel>> getAlbums() async {
    final response = await apiService.getAlbums();
    return response;
  }
}
