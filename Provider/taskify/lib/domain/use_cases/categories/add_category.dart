import 'package:taskify/domain/entities/category.dart';
import 'package:taskify/domain/repositories/category_repository.dart';

class AddCategory {
  final CategoryRepository repository;

  AddCategory({required this.repository});

  Future<void> call(Category category) async {
    return await repository.addCategory(category);
  }
}
