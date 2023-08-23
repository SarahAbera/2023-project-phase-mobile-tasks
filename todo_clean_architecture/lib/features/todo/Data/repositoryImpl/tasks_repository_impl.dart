import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/Network/network_info.dart';
import '../dataSources/tasks_local_datasource.dart';
import '../dataSources/tasks_remote_datasource.dart';
import '../../Domain/entities/task.dart';
import '../../Domain/repositories/task_repository.dart';
import '../models/task_model.dart';

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
  Future<Either<Failure, Tasks>> createTasks(Tasks task) async {
    try {
      final remoteTasks = await remoteDataSource.createTasks(task);
      return Right(remoteTasks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Tasks>> deleteTasks(String taskId) async {
    try {
      final remoteTasks = await remoteDataSource.deleteTasks(taskId);
      return Right(remoteTasks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> getAllTasks() async {
    if (await network.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getAllTasks();
        localDataSource.cacheCurrentTodoList(remoteTasks);
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getAllTasks();
        return Right(localTasks);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Tasks>> getOneTask(String taskId) async {
    try {
      final remoteTasks = await remoteDataSource.getOneTask(taskId);
      return Right(remoteTasks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Tasks>> updateTasks(TaskModel todo) async {
    try {
      final remoteTasks = await remoteDataSource.updateTasks(todo);
      return Right(remoteTasks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
