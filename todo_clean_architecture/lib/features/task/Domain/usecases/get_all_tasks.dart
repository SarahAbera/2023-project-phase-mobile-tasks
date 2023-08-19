import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetAllTasks implements UseCase<List<Tasks>, NoParams> {
  final TasksRepository taskRepository;

  GetAllTasks(this.taskRepository);
  @override
  Future<Either<Failure, List<Tasks>>> call(NoParams params) async {
    return await taskRepository.getAllTasks();
  }
}

