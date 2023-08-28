import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';
import '../../../../core/error/failure.dart';
import '../entities/task.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Tasks>>> getAllTasks();
  Future<Either<Failure, Tasks>> getOneTask(String taskId);
  Future<Either<Failure, Tasks>> createTasks(Tasks task);
  Future<Either<Failure, Tasks>> deleteTasks(String taskId);
  Future<Either<Failure, Tasks>> updateTasks(Tasks todo);
}
