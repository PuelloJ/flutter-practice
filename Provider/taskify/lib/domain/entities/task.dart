class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String categoryId;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.categoryId,
    required this.createdAt,
  });
}
