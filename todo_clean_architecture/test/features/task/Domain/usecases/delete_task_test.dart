import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';
import 'package:todo_clean_architecture/features/task/Domain/entities/task.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/task/Domain/usecases/delete_task.dart';

import 'delete_task_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TasksRepository>()])
void main() {
  late DeleteTask usecase;
  late MockTasksRepository mockTasksRepository;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    usecase = DeleteTask(mockTasksRepository);
  });

  String taskId = "1";
  Tasks task = Tasks(
      id: "2",
      title: "title5",
      description: "desc3",
      dueDate: DateTime(2023, 8, 19));

  test("Should delete the task by it's taskId", () async {
    // arrange
    when(mockTasksRepository.deleteTasks(taskId))
        .thenAnswer((_) async => Right(task));

    // act
    final result = await usecase(taskId);

    // assert
    expect(result, Right(task));
    verify(mockTasksRepository.deleteTasks(taskId));
    verifyNoMoreInteractions(mockTasksRepository);

  });
}
