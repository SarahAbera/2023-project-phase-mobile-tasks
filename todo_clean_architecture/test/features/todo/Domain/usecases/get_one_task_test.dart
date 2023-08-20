import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_clean_architecture/features/todo/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_clean_architecture/features/todo/Domain/usecases/usecases.dart';
import 'get_one_task_test.mocks.dart';
// import 'package:todo_clean_architecture/core/usecase/usecase.dart';

@GenerateNiceMocks([MockSpec<TasksRepository>()])
void main() {
  late GetOneTask usecase;
  late MockTasksRepository mockTasksRepository;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    usecase = GetOneTask(mockTasksRepository);
  });

  String taskId = "1";
  Tasks task = Tasks(
      id: '1',
      title: "title1",
      description: "description1",
      dueDate: DateTime(2023, 8, 10));

  test("Should get one task with the matching taskId", () async {
    // arrange
    when(mockTasksRepository.getOneTask(taskId))
        .thenAnswer((_) async => Right(task));

    // act
    final result = await usecase(taskId);

    // assert
    expect(result, Right(task));
    verify(mockTasksRepository.getOneTask(taskId));
    verifyNoMoreInteractions(mockTasksRepository);
  });
}
