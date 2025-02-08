import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String id,
    required String name,
    required String color,
  }) : super(id: id, name: name, color: color);

  // Convertir de JSON a modelo
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }

  // Convertir de modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
