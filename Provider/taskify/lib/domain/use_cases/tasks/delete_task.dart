import 'package:taskify/domain/repositories/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask({required this.repository});

  Future<void> call(String taskId) async {
    return await repository.deleteTask(taskId);
  }
}
