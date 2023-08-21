import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';

abstract class TasksLocalDataSource {
  Future<List<Tasks>> getAllTasks();
  Future<void> cacheCurrentTodoList(List<Tasks> todoListToCache);
}


