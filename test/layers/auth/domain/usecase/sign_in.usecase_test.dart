import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/core/unions/exception/call_exception.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/layers/auth/domain/entity/signin/signin_entity.dart';
import 'package:flutter_tutorial/layers/auth/domain/repo/auth_repo.dart';
import 'package:flutter_tutorial/layers/auth/domain/usecase/sign_in.usecase.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late SignInUseCase sut; // system under test
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    sut = SignInUseCase(authRepo: mockAuthRepo);
  });

  group('SignInUseCase', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';
    final tSignInEntity = SignInEntity(token: 'test_token');

    test(
      'should return ApiResult<SignInEntity> when sign in is successful',
      () async {
        // arrange
        when(() => mockAuthRepo.signIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => ApiResult.success(tSignInEntity));

        // act
        final result = await sut.call(
          email: tEmail,
          password: tPassword,
        );

        // assert
        expect(result, isMap);
        verify(() => mockAuthRepo.signIn(
              email: tEmail,
              password: tPassword,
            )).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
      },
    );

    test(
      'should return ApiResult.failure when sign in fails',
      () async {
        // arrange
        final tError = CallException(message: 'Sign in failed');
        when(() => mockAuthRepo.signIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => ApiResult.failure(tError));

        // act
        final result = await sut.call(
          email: tEmail,
          password: tPassword,
        );

        // assert
        expect(result, equals(ApiResult.failure(tError)));
        verify(() => mockAuthRepo.signIn(
              email: tEmail,
              password: tPassword,
            )).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
      },
    );
  });
}
