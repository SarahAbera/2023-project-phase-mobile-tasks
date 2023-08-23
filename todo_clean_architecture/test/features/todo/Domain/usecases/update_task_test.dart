import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';
import 'package:todo_clean_architecture/features/todo/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_clean_architecture/features/todo/Domain/usecases/usecases.dart';
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
  
  Tasks tTask = Tasks(
      id: '1',
      title: "title1",
      description: "description1",
      dueDate: DateTime(2023, 8, 10));

  TaskModel todo = TaskModel(
      id: tTask.id,
      title: tTask.title,
      description: tTask.description,
      dueDate: tTask.dueDate);

  test("Should get one task with the matching taskId", () async {
    // arrange
    when(mockTasksRepository.updateTasks(todo))
        .thenAnswer((_) async => Right(tTask));

    // act
    final result = await usecase(todo);

    // assert
    expect(result, Right(tTask));
    verify(mockTasksRepository.updateTasks(todo));
    verifyNoMoreInteractions(mockTasksRepository);
  });
}
