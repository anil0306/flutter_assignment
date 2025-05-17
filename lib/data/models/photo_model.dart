class PhotoModel {
  final int id;
  final String title;
  final String url;

  PhotoModel({required this.id, required this.title, required this.url});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}
