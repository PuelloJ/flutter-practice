import 'package:taskify/domain/entities/task.dart';
import 'package:taskify/domain/repositories/task_repository.dart';

class GetTasksByCategory {
  final TaskRepository repository;

  GetTasksByCategory({required this.repository});

  Future<List<Task>> call(String categoryId) async {
    return await repository.getTasksByCategory(categoryId);
  }
}
