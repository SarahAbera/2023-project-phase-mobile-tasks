import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

class CreateTask {
  final TasksRepository tasksRepository;
  CreateTask(this.tasksRepository);

  Future<Either<Failure, Tasks>> execute({required task}) async {
    return await tasksRepository.createTasks(task);
  }
}
