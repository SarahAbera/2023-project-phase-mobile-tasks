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
  Future<void> cacheCurrentTodoList(List<Tasks> todoListToCache) async{
    await sharedPreferences.setString(
        CACHED_TASKS, jsonEncode(todoListToCache));
  }

  @override
  Future<List<Tasks>> getAllTasks() async {
    final jsonString = sharedPreferences.getString(CACHED_TASKS);
    final decodedJson = json.decode(jsonString!);
    return decodedJson
        .map<TaskModel>((object) => TaskModel.fromJson(object))
        .toList();
  }
}
