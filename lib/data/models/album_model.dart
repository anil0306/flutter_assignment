import 'package:flutter_assignment/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({required super.id, required super.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(id: json['id'] as int, title: json['title'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title};
  }
}
