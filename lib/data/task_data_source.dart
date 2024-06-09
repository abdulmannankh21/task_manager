import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/entities/task.dart';

class TaskDataSource {
  static const _tasksKey = 'tasks';

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_tasksKey);
    if (tasksJson != null) {
      final List<dynamic> tasksList = json.decode(tasksJson);
      return tasksList.map((task) => Task.fromJson(task)).toList();
    }
    return [];
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(tasks.map((task) => task.toJson()).toList());
    prefs.setString(_tasksKey, tasksJson);
  }
}
