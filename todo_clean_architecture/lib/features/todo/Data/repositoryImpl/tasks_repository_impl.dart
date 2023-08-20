import 'package:dartz/dartz.dart';

import 'package:todo_clean_architecture/core/error/failure.dart';
import 'package:todo_clean_architecture/core/playform/network_info.dart';
import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_local_datasource.dart';
import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_remote_datasource.dart';

import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';

import '../../../../../test/features/todo/Data/repository/task_repository_impl_test.mocks.dart';
import '../../Domain/repositories/task_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TasksLocalDataSource localDataSource;
  final Network network;

  TasksRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.network, 
  });

  @override
  Future<Either<Failure, Tasks>> createTasks(Tasks task) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>> deleteTasks(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>> getAllTasks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>> getOneTask(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>> updateTasks(String taskId) {
    throw UnimplementedError();
  }
}
