import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task.dart';

class TaskService {
  TaskService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const _endpoint = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Task>> fetchTasks() async {
    final uri = Uri.parse(_endpoint);
    final response = await _client.get(
      uri,
      headers: {
        'User-Agent': 'TaskManagerApp/1.0',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load tasks (HTTP ${response.statusCode})');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw Exception('Unexpected response format');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(Task.fromJson)
        .toList(growable: false);
  }
}

