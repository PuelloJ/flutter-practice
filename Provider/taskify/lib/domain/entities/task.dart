// enum Priority { high, medium, low }

import 'package:taskify/core/constants/task_priority.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String categoryId;
  final DateTime createdAt;
  final DateTime endDate;
  final TaskPriority taskPriority; 

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.categoryId,
    required this.createdAt,
    required this.endDate,
    required this.taskPriority,
  });
}
