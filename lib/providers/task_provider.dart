import 'package:flutter/foundation.dart';

import '../models/task.dart';
import '../services/task_service.dart';

enum TaskFilter { all, completed, pending }

class TaskProvider extends ChangeNotifier {
  TaskProvider({TaskService? service}) : _service = service ?? TaskService();

  final TaskService _service;

  List<Task> _tasks = const [];
  bool _isLoading = false;
  String? _errorMessage;
  TaskFilter _filter = TaskFilter.all;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  TaskFilter get filter => _filter;

  List<Task> get filteredTasks {
    return switch (_filter) {
      TaskFilter.all => _tasks,
      TaskFilter.completed => _tasks.where((t) => t.completed).toList(growable: false),
      TaskFilter.pending => _tasks.where((t) => !t.completed).toList(growable: false),
    };
  }

  int get completedCount => _tasks.where((t) => t.completed).length;
  int get pendingCount => _tasks.where((t) => !t.completed).length;

  void setFilter(TaskFilter value) {
    if (_filter == value) return;
    _filter = value;
    notifyListeners();
  }

  /// Add a new task locally.
  void addTask(String title) {
    final maxId = _tasks.fold<int>(0, (prev, t) => t.id > prev ? t.id : prev);
    final newTask = Task(
      id: maxId + 1,
      userId: 1,
      title: title.trim(),
      completed: false,
    );
    _tasks = [newTask, ..._tasks];
    notifyListeners();
  }

  /// Toggle the completion status of a task.
  void toggleTask(int taskId) {
    _tasks = _tasks.map((t) {
      if (t.id == taskId) return t.copyWith(completed: !t.completed);
      return t;
    }).toList();
    notifyListeners();
  }

  /// Delete a task by ID.
  void deleteTask(int taskId) {
    _tasks = _tasks.where((t) => t.id != taskId).toList();
    notifyListeners();
  }

  Future<void> loadTasks({bool forceRefresh = false}) async {
    if (_isLoading) return;
    if (!forceRefresh && _tasks.isNotEmpty) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tasks = await _service.fetchTasks();
    } catch (e) {
      _errorMessage = 'Failed to load tasks from API: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

