part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}
class CreateTaskEvent extends TodoEvent {
  final Tasks task;
  CreateTaskEvent(this.task);
}

class EditTaskEvent extends TodoEvent {
  final Tasks task;
  EditTaskEvent(this.task);
}

class GetAllTasksEvent extends TodoEvent {}


class GetSingleTasksEvent extends TodoEvent {
  final String taskId;
  const GetSingleTasksEvent({required this.taskId});
}

class DeleteTaskEvent extends TodoEvent {
  final String taskId;
  const DeleteTaskEvent({required this.taskId});
}
