import 'dart:io';

class ImageModel {
  final String? imageUrl; // Para imágenes de assets o URLs.
  final File? imageFile; // Para imágenes cargadas por el usuario.
  final String name;
  final DateTime date;
  bool favorite;
  final String author;
  final String description;
  final String? source;
  final String? location;
  final String? camera;

  ImageModel({
    required this.name,
    required this.author,
    required this.description,
    required this.date,
    required this.favorite,
    this.imageUrl,
    this.imageFile,
    this.source,
    this.location,
    this.camera,
  });

  factory ImageModel.fromUser(
    File? imageFile, {
    required String name,
    bool favorite = false,
    required String author,
    required String description,
    DateTime? date,
    String? source,
    String? location,
    String? camera,
  }) =>
      ImageModel(
        imageFile: imageFile,
        name: name,
        favorite: favorite,
        author: author,
        description: description,
        source: source,
        date:
            date ?? DateTime.now(),
        location: location,
        camera: camera,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imageUrl: json["imageUrl"],
        name: json["name"],
        favorite: json["favorite"],
        author: json["author"],
        source: json["source"],
        description: json["description"],
        date: DateTime.parse(json['date']),
        location: json["location"],
        camera: json["camera"],
      );

  void toggleFavorite() {
    favorite = !favorite;
  }
}
