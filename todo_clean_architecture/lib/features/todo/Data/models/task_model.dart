import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';

class TaskModel extends Tasks {
  TaskModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.dueDate,
      super.completed = false});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      dueDate: DateTime.parse(json["dueDate"]),
      completed: json["status"] == "Completed",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dueDate": dueDate.toIso8601String(),
      "status": completed ? 'Completed' : 'In Progress',
    };
  }

  Object? map(Function(dynamic task) param0) {}
}
