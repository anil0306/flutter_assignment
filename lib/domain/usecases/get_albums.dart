import 'package:flutter_assignment/domain/entities/album.dart';
import 'package:flutter_assignment/domain/repositories/album_repository.dart';

class GetAlbums {
  final AlbumRepository repository;

  GetAlbums(this.repository);

  Future<List<Album>> call() async => await repository.getAlbums();
}
