import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/task.dart';

class CreateTask implements UseCase<Tasks, Params> {
  final TasksRepository tasksRepository;
  CreateTask(this.tasksRepository);

  @override
  Future<Either<Failure, Tasks>> call(Params params) async {
    return await tasksRepository.createTasks(params.task);
  }
}

class Params extends Equatable {
  final Tasks task;
  const Params({required this.task});

  @override
  List<Object?> get props => [task];
}
