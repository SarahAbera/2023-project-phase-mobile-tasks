// import 'package:flutter/services.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_local_datasource.dart';
// import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';
// import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';
// import 'dart:convert';
// import '../../../fixtures/fixture_reader.dart';
// import 'local_dataSource_test.mocks.dart';

// @GenerateNiceMocks([MockSpec<SharedPreferences>()])
// void main() {
//   late MockSharedPreferences mockSharedPreferences;
//   late TasksLocalDataSourceImpl tasksLocalDataSourceImpl;

//   setUp(() {
//     mockSharedPreferences = MockSharedPreferences();
//     tasksLocalDataSourceImpl =
//         TasksLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
//   });

//   final tTasks = [
//     TaskModel(
//         id: "1",
//         title: "test task",
//         description: "test description",
//         dueDate: DateTime(2019, 01, 01),
//         completed: true),
//     TaskModel(
//         id: "1",
//         title: "test task",
//         description: "test description",
//         dueDate: DateTime(2019, 01, 01),
//         completed: true)
//   ];

//   group("Get all tasks", () {
//     test("should return tasks list from sharedPreference", () async {
//       // arrange
//       when(mockSharedPreferences.getString(any))
//           .thenAnswer((_) => fixture("cached_task.json"));
//       // act
//       final result = await tasksLocalDataSourceImpl.getAllTasks();
//       // assert
//       verify(mockSharedPreferences.getString(CACHED_TASKS));
//       expect(result, tTasks);
//     });
    
//     test("should call sharedpreferences to cache data", () async {
//       final tTask = [
//         Tasks(
//           id: "2",
//           title: "title",
//           description: "description",
//           dueDate: DateTime(2020, 09, 08),
//           completed: true,
//         )
//       ];
//       // act
//       tasksLocalDataSourceImpl.cacheCurrentTodoList(tTask);
//       // assert
//       final expectedResult = TaskModel(
//         id: "2",
//         title: 'title',
//         description: 'description',
//         dueDate: DateTime(2020, 09, 08),
//         completed: true,
//       );
//       final expectedStringJson = json.encode(expectedResult.map((task) => task.toJson()));
//       verify(mockSharedPreferences.setString(CACHED_TASKS, expectedStringJson));
//     });
//   });
// }
