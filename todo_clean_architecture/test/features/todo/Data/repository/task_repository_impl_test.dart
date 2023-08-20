import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_clean_architecture/core/playform/network_info.dart';
import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_local_datasource.dart';
import 'package:todo_clean_architecture/features/todo/Data/dataSources/tasks_remote_datasource.dart';
import 'package:todo_clean_architecture/features/todo/Data/repositoryImpl/tasks_repository_impl.dart';

import 'task_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TasksRepositoryImpl>()])
@GenerateNiceMocks([MockSpec<TasksLocalDataSource>()])
@GenerateNiceMocks([MockSpec<TaskRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<Network>()])
void main() {
  TasksRepositoryImpl repositoryImpl;
  MockTaskRemoteDataSource mockTaskRemoteDataSource;
  MockTasksLocalDataSource mockTasksLocalDataSource;
  MockNetwork mockNetwork;

  setUp(() {
    mockNetwork = MockNetwork();
    mockTaskRemoteDataSource = MockTaskRemoteDataSource();
    mockTasksLocalDataSource = MockTasksLocalDataSource();
    repositoryImpl = TasksRepositoryImpl(
        remoteDataSource: mockTaskRemoteDataSource,
        localDataSource: mockTasksLocalDataSource,
        network: mockNetwork
      );
  });
}
