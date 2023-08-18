import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_clean_architecture/features/task/Domain/entities/task.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/task/Domain/usecases/create_task.dart';
import 'create_task_test.mocks.dart';
@GenerateNiceMocks([MockSpec<TasksRepository>()])

void main() {
  late CreateTask usecase;
  late MockTasksRepository mockTasksRepository;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    usecase = CreateTask(mockTasksRepository);
  });

  Tasks task = Tasks(
      id: "2",
      title: "title5",
      description: "desc3",
      dueDate: DateTime(2023, 8, 19));

  test("Should delete the task by it's taskId", () async {
    // arrange
    when(mockTasksRepository.createTasks(task))
        .thenAnswer((_) async => Right(task));

    // act
    final result = await usecase.execute(task:task);

    // assert
    expect(result, Right(task));
    verify(mockTasksRepository.createTasks(task));
    verifyNoMoreInteractions(mockTasksRepository);

  });
}


