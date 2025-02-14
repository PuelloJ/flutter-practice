class TaskModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String categoryId;
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
}
