import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/create_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/delete_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/get_one_task.dart';
import 'package:todo_clean_architecture/features/todo/Domain/usecases/update_task.dart';
import '../../../../core/usecase/usecase.dart';
import '../../Data/dataSources/tasks_local_datasource.dart';
import '../../Data/dataSources/tasks_remote_datasource.dart';
import '../../Data/repositoryImpl/tasks_repository_impl.dart';
import '../../Domain/repositories/task_repository.dart';
import '../../Domain/usecases/get_all_tasks.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Network/network_info.dart';
import '../../Domain/entities/task.dart';
import 'package:dartz/dartz.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  GetAllTasks getAllTasks;
  GetOneTask getOneTask;
  DeleteTask deleteTask;
  UpdateTask updateTask;
  CreateTask createTask;

  TodoBloc(
      {required this.getAllTasks,
      required this.getOneTask,
      required this.deleteTask,
      required this.updateTask,
      required this.createTask})
      : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {});

    on<CreateTaskEvent>((event, emit) async {
      emit(TaskLoadingState());
      print("creating evennnnt");
      final result = await createTask(event.task);
      result.fold(
          (l) => {emit(TaskFailureState())},
          (r) => {
                emit(TaskLoadedState([r]))
              });
    });

    on<EditTaskEvent>((event, emit) async {
      emit(TaskLoadingState());
      final result = await updateTask(event.task);
      result.fold((failure) => emit(TaskFailureState()),
          (success) => (emit(TaskLoadedState([success]))));
    });

    on<GetAllTasksEvent>((event, emit) async {
      emit(TaskLoadingState());
      final result = await getAllTasks(NoParams());
      result.fold(
          (l) => emit(TaskFailureState()), (r) => emit(TaskLoadedState(r)));
    });

    on<GetSingleTasksEvent>((event, emit) async {
      emit(TaskLoadingState());
      final result = await getOneTask(event.taskId);
      result.fold(
          (l) => emit(TaskFailureState()), (r) => emit(TaskLoadedState([r])));
    });

    on<DeleteTaskEvent>((event, emit) async {
      emit(TaskLoadingState());
      final result = await deleteTask(event.taskId);
      result.fold(
          (l) => emit(TaskFailureState()), (r) => emit(TaskLoadedState([r])));
    });
  }
}
