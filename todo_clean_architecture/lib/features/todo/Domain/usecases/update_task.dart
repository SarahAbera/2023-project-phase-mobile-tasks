import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';
import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTask implements UseCase<Tasks, TaskModel> {
  final TasksRepository tasksRepository;
  UpdateTask(this.tasksRepository);
  @override
  Future<Either<Failure, Tasks>> call(TaskModel param) async {
    return await tasksRepository.updateTasks(param);
  }
}
