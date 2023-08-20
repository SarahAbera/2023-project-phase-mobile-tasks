import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_clean_architecture/features/todo/Data/models/task_model.dart';
import 'package:todo_clean_architecture/features/todo/Domain/entities/task.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTaskModel = TaskModel(
    id: '1',
    title: "test task",
    description: "test description",
    dueDate: DateTime(2019, 1, 1),
    completed: true,
  );

  test("tTaskModel should be a subclass of a Tasks entity",
      () async => expect(tTaskModel, isA<Tasks>()));

  group("Json conversion", () {
    test("fromJson", () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("tasks.json"));
      // act
      final result = TaskModel.fromJson(jsonMap);
      // assert
      expect(result, tTaskModel);
    });

    test("toJson", () async {
      // act
      final result = tTaskModel.toJson();

      // assert
      final expectedMap = {
        "id": "1",
        "title": "test task",
        "description": "test description",
        "dueDate": "2019-01-01T00:00:00.000",
        "status": "Completed"
      };

      expect(result, expectedMap);
    });
  });
}
