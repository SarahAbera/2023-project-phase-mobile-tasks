import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_clean_architecture/core/Network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
@GenerateNiceMocks([MockSpec<Network>()])
void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkImpl networkImpl;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkImpl = NetworkImpl(mockInternetConnectionChecker);
  });

  test("isConnected", () {
    final tHasConnection = Future.value(true);
    // arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) => tHasConnection);
    // act
    final result = networkImpl.isConnected;

    // assert
    verify(mockInternetConnectionChecker.hasConnection);
    expect(result, tHasConnection);
  });
}
