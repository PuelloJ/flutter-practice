class ImageModel {
  final String imageUrl;
  final String name;

  ImageModel({
    required this.imageUrl,
    required this.name,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
      };
}
