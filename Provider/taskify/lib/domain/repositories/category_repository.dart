import 'package:taskify/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<void> addCategory(Category category);
  Future<List<Category>> getCategories();
  Future<void> deleteCategory(String categoryId);
}
