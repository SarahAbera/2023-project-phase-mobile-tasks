import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

class GetAllTasks {
  final TasksRepository taskRepository;

  GetAllTasks(this.taskRepository);

  Future<Either<Failure, List<Tasks>>> execute() async {
    return await taskRepository.getAllTasks();
  }
}
