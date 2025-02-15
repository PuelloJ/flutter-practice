import 'package:taskify/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTasksByCategory(String categoryId);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
}
