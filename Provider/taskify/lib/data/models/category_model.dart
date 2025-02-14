class CategoryModel {
  final String id;
  final String name;
  final String color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], name: json['name'], color: json['color']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
