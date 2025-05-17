import 'package:flutter_assignment/domain/entities/photo.dart';
import 'package:flutter_assignment/domain/repositories/album_repository.dart';

class GetPhotos {
  final AlbumRepository repository;

  GetPhotos(this.repository);

  Future<List<Photo>> call(int albumId) async =>
      await repository.getPhotos(albumId);
}
