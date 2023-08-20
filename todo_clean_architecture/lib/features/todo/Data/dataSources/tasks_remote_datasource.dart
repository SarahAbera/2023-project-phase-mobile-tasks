import '../../Domain/entities/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<Tasks>> getAllTasks();
  Future<Tasks> getOneTask(String taskId);
  Future<Tasks> createTasks(Tasks task);
  Future<Tasks> deleteTasks(String taskId);
  Future<Tasks> updateTasks(String taskId);
}