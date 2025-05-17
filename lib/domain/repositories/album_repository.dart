import 'package:flutter_assignment/data/models/photo_model.dart';
import 'package:flutter_assignment/domain/entities/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<PhotoModel>> getPhotos(int albumId);
}
