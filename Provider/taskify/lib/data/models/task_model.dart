

import '../../domain/entities/task.dart';

class TaskModel extends Task {
  
  // final String id;
  // final String title;
  // final String description;
  // final bool isCompleted;
  // final String categoryId;
  // final DateTime createdAt;
  
  TaskModel({
    required String id,
    required String title,
    required String description,
    bool isCompleted = false,
    required String categoryId,
    required DateTime createdAt,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          categoryId: categoryId,
          createdAt: createdAt,
        );

  // Convertir de JSON a modelo
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
      categoryId: json['categoryId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Convertir de modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'categoryId': categoryId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
