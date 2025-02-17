import 'package:hive/hive.dart';
import 'package:taskify/domain/entities/category.dart';
part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], name: json['name'], color: json['color']);

  factory CategoryModel.fromEntiti(Category category) => CategoryModel(
        id: category.id,
        name: category.name,
        color: category.color,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      color: color,
    );
  }
}
