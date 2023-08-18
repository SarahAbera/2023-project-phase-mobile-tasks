import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/error/failure.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';
import '../entities/task.dart';

class GetOneTask {
  final TasksRepository tasksRepository;
  GetOneTask(this.tasksRepository);

  Future<Either<Failure, Tasks>> execute({required String taskId}) async {
    return await tasksRepository.getOneTask(taskId);
  }
}
