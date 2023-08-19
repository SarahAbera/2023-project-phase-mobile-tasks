import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/task/Domain/entities/task.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_clean_architecture/features/task/Domain/usecases/usecases.dart';
import 'get_one_task_test.mocks.dart';
// import 'package:todo_clean_architecture/core/usecase/usecase.dart';

@GenerateNiceMocks([MockSpec<TasksRepository>()])
void main() {
  late UpdateTask usecase;
  late MockTasksRepository mockTasksRepository;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    usecase = UpdateTask(mockTasksRepository);
  });

  String tTaskId = "1";
  Tasks tTask = Tasks(
      id: '1',
      title: "title1",
      description: "description1",
      dueDate: DateTime(2023, 8, 10));

  test("Should get one task with the matching taskId", () async {
    // arrange
    when(mockTasksRepository.updateTasks(tTaskId))
        .thenAnswer((_) async => Right(tTask));

    // act
    final result = await usecase(tTaskId);

    // assert
    expect(result, Right(tTask));
    verify(mockTasksRepository.updateTasks(tTaskId));
    verifyNoMoreInteractions(mockTasksRepository);
  });
}
