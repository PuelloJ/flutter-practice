import 'package:taskify/data/datasources/local/hive_local_datasorce.dart';
import 'package:taskify/data/models/task_model.dart';
import 'package:taskify/domain/entities/task.dart';
import 'package:taskify/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final HiveLocalDatasorce hiveLocalDataSource;

  TaskRepositoryImpl({required this.hiveLocalDataSource});

  @override
  Future<void> addTask(Task task) async {
    await hiveLocalDataSource.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await hiveLocalDataSource.deleteTask(taskId);
  }

  @override
  Future<List<Task>> getTasksByCategory(String categoryId) async {
    final List<TaskModel> tasks = await hiveLocalDataSource.getTasksByCategory(categoryId);
    return tasks.map((task) => task.toEntiti()).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    hiveLocalDataSource.updateTask(TaskModel.fromEntity(task));
  }
}
