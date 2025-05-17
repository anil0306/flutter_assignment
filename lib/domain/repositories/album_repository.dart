import 'package:flutter_assignment/domain/entities/album.dart';
import 'package:flutter_assignment/domain/entities/photo.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Photo>> getPhotos(int albumId);
}
