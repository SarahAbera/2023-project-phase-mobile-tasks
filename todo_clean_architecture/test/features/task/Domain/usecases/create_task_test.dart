import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_clean_architecture/core/usecase/usecase.dart';
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

  Tasks tTask = Tasks(
      id: "2",
      title: "title5",
      description: "desc3",
      dueDate: DateTime(2023, 8, 19));

  test("Should create the tTask", () async {
    // arrange
    when(mockTasksRepository.createTasks(tTask))
        .thenAnswer((_) async => Right(tTask));

    // act
    final result = await usecase(Params(task: tTask));

    // assert
    expect(result, Right(tTask));
    verify(mockTasksRepository.createTasks(tTask));
    verifyNoMoreInteractions(mockTasksRepository);

  });
}


