import 'package:dio/dio.dart';
import 'package:flutter_assignment/data/models/album_model.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<List<AlbumModel>> getAlbums() async {
    final response = await dio.get('/albums');
    return (response.data as List)
        .map((album) => AlbumModel.fromJson(album))
        .toList();
  }
}
