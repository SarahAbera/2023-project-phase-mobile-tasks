import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/task_repository.dart';
import '../entities/task.dart';

class GetOneTask extends UseCase<Tasks, String> {
  final TasksRepository tasksRepository;
  GetOneTask(this.tasksRepository);
  @override
  Future<Either<Failure, Tasks>> call(String params) async {
    return await tasksRepository.getOneTask(params);
  }
}
