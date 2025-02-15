import 'package:taskify/domain/entities/task.dart';
import 'package:taskify/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask({required this.repository});

  Future<void> call(Task task) async {
    return await repository.addTask(task);
  }
}
