import 'package:dio/dio.dart';
import 'package:flutter_assignment/data/models/album_model.dart';
import 'package:flutter_assignment/data/models/photo_model.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<AlbumModel>> getAlbums() async {
    final response = await dio.get('/albums');
    return (response.data as List)
        .map((album) => AlbumModel.fromJson(album))
        .toList();
  }

  Future<List<PhotoModel>> getPhotos(int albumId) async {
    final response = await dio.get(
      '/photos',
      queryParameters: {'albumId': albumId},
    );
    return (response.data as List)
        .map((photo) => PhotoModel.fromJson(photo))
        .toList();
  }
}
