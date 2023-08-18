import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

class DeleteTask {
  final TasksRepository tasksRepository;
  DeleteTask(this.tasksRepository);

  Future<Either<Failure, Tasks>> execute({required taskId}) async {
    return await tasksRepository.deleteTasks(taskId);
  }
}
