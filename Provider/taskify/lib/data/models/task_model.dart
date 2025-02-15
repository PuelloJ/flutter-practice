import 'package:hive/hive.dart';
import 'package:taskify/domain/entities/task.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final String categoryId;

  @HiveField(5)
  final DateTime createdAt;

  // final Priority priority;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.categoryId,
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'],
        categoryId: json['categoryId'],
        createdAt: json['createdAt'],
      );

  factory TaskModel.fromEntity(Task task) => TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        categoryId: task.categoryId,
        createdAt: task.createdAt,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'categoryId': categoryId,
      'createdAt': createdAt,
    };
  }

  Task toEntiti() {
    return Task(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        categoryId: categoryId,
        createdAt: createdAt);
  }
}
