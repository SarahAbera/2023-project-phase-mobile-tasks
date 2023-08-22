import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';
import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';

abstract class TasksLocalDataSource {
  Future<List<Tasks>> getAllTasks();
  Future<void> cacheCurrentTodoList(List<Tasks> todoListToCache);
}

const CACHED_TASKS = "CACHED_TASKS";

class TasksLocalDataSourceImpl implements TasksLocalDataSource {
  final SharedPreferences sharedPreferences;

  TasksLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCurrentTodoList(List<Tasks> todoListToCache) async {
    final tasks = todoListToCache.map((task) {
      TaskModel taskModel = TaskModel(
          id: task.id,
          title: task.title,
          description: task.description,
          dueDate: task.dueDate);

      return jsonEncode(taskModel.toJson());
    }).toList();
    await sharedPreferences.setStringList(CACHED_TASKS, tasks);
  }

  @override
  Future<List<Tasks>> getAllTasks() async {
    final jsonStrings = sharedPreferences.getStringList(CACHED_TASKS);
    final taskModels = jsonStrings!
        .map((encodedJson) => TaskModel.fromJson(jsonDecode(encodedJson)))
        .toList();
    return taskModels;
  }
}
