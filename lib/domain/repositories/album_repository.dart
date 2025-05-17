import 'package:flutter_assignment/domain/entities/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
}
