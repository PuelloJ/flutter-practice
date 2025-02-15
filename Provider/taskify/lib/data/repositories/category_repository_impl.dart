import 'package:taskify/data/datasources/local/hive_local_datasorce.dart';
import 'package:taskify/data/models/category_model.dart';
import 'package:taskify/domain/entities/category.dart';
import 'package:taskify/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final HiveLocalDatasorce hiveLocalDataSource;

  CategoryRepositoryImpl({required this.hiveLocalDataSource});

  @override
  Future<void> addCategory(Category category) async {
    await hiveLocalDataSource.addCategory(CategoryModel.fromEntiti(category));
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    await hiveLocalDataSource.deleteCategory(categoryId);
  }

  @override
  Future<List<Category>> getCategories() async {
    final List<CategoryModel> categories = await hiveLocalDataSource.getCategories();
    return categories.map((category) => category.toEntiti()).toList();
  }
}
