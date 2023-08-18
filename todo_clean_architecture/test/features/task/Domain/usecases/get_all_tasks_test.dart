import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_clean_architecture/features/task/Domain/repositories/task_repository.dart';
import 'package:todo_clean_architecture/features/task/Domain/usecases/get_all_tasks.dart';
import 'package:todo_clean_architecture/features/task/Domain/entities/task.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'get_all_tasks_test.mocks.dart';
// import 'package:todo_clean_architecture/core/usecase/usecase.dart';

@GenerateNiceMocks([MockSpec<TasksRepository>()])
void main() {
  late MockTasksRepository mockTasksRepository;
  late GetAllTasks usecase;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    usecase = GetAllTasks(mockTasksRepository);
  });

  test("should return all tasks", () async {
    final List<Tasks> tasks = [
      Tasks(
        id: "",
        title: "title",
        description: "Desc",
        dueDate: DateTime(2023, 8, 17),
        completed: false,
      ),
      Tasks(
        id: "",
        title: "title2",
        description: "Desc2",
        dueDate: DateTime(2023, 8, 17),
        completed: false,
      ),
    ];
    // arrange
    when(mockTasksRepository.getAllTasks())
        .thenAnswer((_) async => Right(tasks));
    // act

    // final result = await usecase(NoParams());
    final result = await usecase.execute();

    // assert
    expect(result, Right(tasks));
    verify(mockTasksRepository.getAllTasks());
    verifyNoMoreInteractions(mockTasksRepository);
  });
}
