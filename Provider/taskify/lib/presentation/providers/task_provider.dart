import 'package:flutter/material.dart';
import 'package:taskify/domain/entities/task.dart';
import 'package:taskify/domain/use_cases/tasks/add_task.dart';
import 'package:taskify/domain/use_cases/tasks/delete_task.dart';
import 'package:taskify/domain/use_cases/tasks/get_tasks_by_category.dart';
import 'package:taskify/domain/use_cases/tasks/update_task.dart';

class TaskProvider with ChangeNotifier {
  final AddTask addTask;
  final GetTasksByCategory getTasksByCategory;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;
  List<Task> _tasks = [];

  TaskProvider({
    required this.addTask,
    required this.getTasksByCategory,
    required this.updateTask,
    required this.deleteTask,
  });

  List<Task> get tasks => _tasks;

  Future<void> fetchTaskByCategory(String categoryId) async {
    _tasks = await getTasksByCategory(categoryId);
    notifyListeners();
  }

  Future<void> addNewTask(Task task) async {
    await addTask(task);
    await fetchTaskByCategory(task.categoryId);
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final Task updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
      categoryId: task.categoryId,
      createdAt: task.createdAt,
      endDate: task.endDate,
      taskPriority: task.taskPriority,
    );
    await updateTask(updatedTask);
    await fetchTaskByCategory(updatedTask.categoryId);
  }

  Future<void> removeTask(String taskId, String categoryId) async {
    await deleteTask(taskId);
    await fetchTaskByCategory(categoryId);
  }
}
