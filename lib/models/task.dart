class Task {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const Task({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      title: (json['title'] as String?)?.trim() ?? '',
      completed: (json['completed'] as bool?) ?? false,
    );
  }

  Task copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

