import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class DeleteTask implements UseCase<Tasks, String> {
  final TasksRepository tasksRepository;
  DeleteTask(this.tasksRepository);
  @override
  Future<Either<Failure, Tasks>> call(String params) async {
    return await tasksRepository.deleteTasks(params);
  }
}


