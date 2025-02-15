import 'package:taskify/domain/repositories/category_repository.dart';

class DeleteCategory {
  final CategoryRepository repository;

  DeleteCategory({required this.repository});

  Future<void> call(String categoryId) async {
    return await repository.deleteCategory(categoryId);
  }
}
