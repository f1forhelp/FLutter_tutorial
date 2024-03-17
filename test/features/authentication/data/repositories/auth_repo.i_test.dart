import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import 'package:flutter_tutorial/features/authentication/data/repositories/auth_repo.i.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteSource extends Mock implements AuthRemoteSource {}

void main() {
  late AuthRemoteSource authRemoteSource;
  late AuthRepoI authRepoI;

  setUpAll(() {
    authRemoteSource = MockAuthRemoteSource();
    authRepoI = AuthRepoI(authRemoteSource: authRemoteSource);
  });

  setUp(() {
    reset(authRemoteSource);
    resetMocktailState();
  });

  group('SUT- getCurrentUser', () {
    test("Should ", () => null);
  });
}
