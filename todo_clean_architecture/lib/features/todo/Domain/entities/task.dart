import 'package:equatable/equatable.dart';


class Tasks extends Equatable{
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool completed;

  const Tasks(
      {required this.id,
      required this.title,
      required this.description,
      required this.dueDate,
      this.completed = false});

  @override
  List<Object?> get props => [id, title, description, dueDate, completed];

}
