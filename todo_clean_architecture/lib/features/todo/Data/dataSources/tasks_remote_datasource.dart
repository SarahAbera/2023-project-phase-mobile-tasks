import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../../Domain/entities/task.dart';
import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<Tasks>> getAllTasks();
  Future<Tasks> getOneTask(String taskId);
  Future<Tasks> createTasks(Tasks task);
  Future<Tasks> deleteTasks(String taskId);
  Future<Tasks> updateTasks(Tasks todo);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;
  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<Tasks> createTasks(Tasks todo) async {
    final taskToBeCreated = TaskModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      dueDate: todo.dueDate,
    );
    var url = Uri.parse("https://mock-todo-api-ib6b.onrender.com/api/v1/todo");
    var header = {"content": "application/json"};
    var body = json.encode(taskToBeCreated.toJson());
    try {
      final response = await client.post(url, headers: header, body: body);
      print(response.body);
      final responseFromBackend = jsonDecode(response.body)["data"];
      final createdTask = TaskModel.fromJson(responseFromBackend);

      return createdTask;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Tasks> deleteTasks(String taskId) async {
    var url = Uri.parse(
        "https://mock-todo-api-ib6b.onrender.com/api/v1/todo/$taskId");
    var header = {"content": "application/json"};
    try {
      final response = await client.delete(url, headers: header);

      if (response.statusCode == 200) {
        final responseFromBackend = jsonDecode(response.body);
        final deletedTaskModel = TaskModel.fromJson(responseFromBackend);
        return deletedTaskModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Tasks>> getAllTasks() async {
    String url = "https://mock-todo-api-ib6b.onrender.com/api/v1/todo";
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {"content": 'application/json'},
      );

      final List returnedFromBackend = jsonDecode(response.body)["data"];
      List<TaskModel> tasks = returnedFromBackend
          .map((jsonTask) => TaskModel.fromJson(jsonTask))
          .toList();
      return tasks;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Tasks> getOneTask(String taskId) async {
    var url = Uri.parse(
        "https://mock-todo-api-ib6b.onrender.com/api/v1/todo/$taskId");
    var header = {"content": "application/json"};

    try {
      final response = await client.get(url, headers: header);
      if (response.statusCode == 200) {
        final responseTask = jsonDecode(response.body);
        final respondedTask = TaskModel.fromJson(responseTask);

        return respondedTask;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Tasks> updateTasks(Tasks todo) async {
    var url = Uri.parse(
        "https://mock-todo-api-ib6b.onrender.com/api/v1/todo/${todo.id}");
    var header = {"content": "application/json"};
    final task = TaskModel(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        dueDate: todo.dueDate);
    var body = jsonEncode(task.toJson());
    final response = await client.put(url, headers: header, body: body);
    try {
      if (response.statusCode == 200) {
        final responseTask = jsonDecode(response.body);
        final updatedTaskModel = TaskModel.fromJson(responseTask);
        return updatedTaskModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
