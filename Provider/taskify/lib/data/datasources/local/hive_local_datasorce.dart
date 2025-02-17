import 'package:hive_flutter/adapters.dart';
import 'package:taskify/data/models/category_model.dart';
import 'package:taskify/data/models/task_model.dart';

class HiveLocalDatasorce {
  late Box<CategoryModel> categoryBox;
  late Box<TaskModel> taskBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(TaskModelAdapter());

    categoryBox = await Hive.openBox<CategoryModel>('categories');
    taskBox = await Hive.openBox<TaskModel>('tasks');
  }

  /// Categories

  Future<void> addCategory(CategoryModel category) async {
    await categoryBox.put(category.id, category);
  }

  Future<List<CategoryModel>> getCategories() async {
    return categoryBox.values.toList();
  }

  Future<void> deleteCategory(String categoryId) async {
    await categoryBox.delete(categoryId);
    final tasks = await getTasksByCategory(categoryId);
    for (var task in tasks) {
      await deleteTask(task.id);
    }
  }

  /// Tasks

  Future<List<TaskModel>> getTasksByCategory(String categoryId) async {
    return taskBox.values
        .where((task) => task.categoryId == categoryId)
        .toList();
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> updateTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> deleteTask(String taskId) async {
    await taskBox.delete(taskId);
  }

  dispose() {
    taskBox.close();
    categoryBox.close();
  }
}
