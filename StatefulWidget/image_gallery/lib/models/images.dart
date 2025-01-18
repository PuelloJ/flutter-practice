class ImageModel {
  final String imageUrl;
  final String name;
  final int likes;
  final String author;
  final String source;
  final String description;
  final DateTime date;
  final String location;
  final String camera;

  ImageModel({
    required this.imageUrl,
    required this.name,
    required this.likes,
    required this.author,
    required this.source,
    required this.description,
    required this.date,
    required this.location,
    required this.camera,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imageUrl: json["imageUrl"],
        name: json["name"],
        likes: json["likes"],
        author: json["author"],
        source: json["source"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        location: json["location"],
        camera: json["camera"],
      );
}
