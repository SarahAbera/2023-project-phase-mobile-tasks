part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TaskFailureState extends TodoState {
  final message;
  TaskFailureState({this.message = "Failed"});
}

class TaskLoadingState extends TodoState {}

class TaskLoadedState extends TodoState {
  final List<Tasks> tasks;
  TaskLoadedState(this.tasks);
}
