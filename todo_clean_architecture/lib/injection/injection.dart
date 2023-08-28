import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_clean_architecture/core/Network/network_info.dart';
import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_local_datasource.dart';
import 'package:todo_clean_architecture/features/todo/Data/repositoryImpl/tasks_repository_impl.dart';
import 'package:todo_clean_architecture/features/todo/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/create_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/delete_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/get_all_tasks.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/get_one_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/update_task.dart';
import 'package:todo_clean_architecture/features/todo/Presentation/bloc/todo_bloc.dart';

import '../features/todo/Data/dataSources/tasks_remote_datasource.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => TodoBloc(
      getAllTasks: sl(),
      getOneTask: sl(),
      deleteTask: sl(),
      updateTask: sl(),
      createTask: sl()));

  // usecase
  sl.registerFactory(() => GetAllTasks(sl()));
  sl.registerFactory(() => GetOneTask(sl()));
  sl.registerFactory(() => UpdateTask(sl()));
  sl.registerFactory(() => DeleteTask(sl()));
  sl.registerFactory(() => CreateTask(sl()));

  // Repository
  sl.registerLazySingleton<TasksRepository>(() => TasksRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), network: sl()));

  // DataSource

  sl.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<TasksLocalDataSource>(
      () => TasksLocalDataSourceImpl(sharedPreferences: sl()));

  // core
  sl.registerLazySingleton<Network>(() => NetworkImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
