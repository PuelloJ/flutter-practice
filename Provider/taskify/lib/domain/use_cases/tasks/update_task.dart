import 'package:taskify/domain/entities/task.dart';
import 'package:taskify/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask({required this.repository});

  Future<void> call(Task task) async {
    return await repository.updateTask(task);
  }
}
