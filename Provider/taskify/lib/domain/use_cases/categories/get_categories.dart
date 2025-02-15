import 'package:taskify/domain/entities/category.dart';
import 'package:taskify/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories({required this.repository});

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
