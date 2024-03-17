import 'dart:convert';

import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

extension DioAdapterMockEx on DioAdapterMock {
  buildMockFetch(
      {required Map<String, dynamic> response, int statusCode = 200}) {
    when(
      () => fetch(any(), any(), any()),
    ).thenAnswer((invocation) async => await Future.value(
            ResponseBody.fromString(jsonEncode(response), statusCode, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType]
        })));
  }

  Future<ResponseBody> getVerifyCall() {
    return fetch(any(), any(), any());
  }
}

void main() {
  final Dio dio = Dio();
  late DioAdapterMock dioAdapterMock;

  late AuthRemoteSource authRemoteSource;
  setUpAll(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    authRemoteSource = AuthRemoteSource(dio);
    registerFallbackValue(RequestOptions());
  });

  //Resetting state so that there want be error regarding no of calls.
  setUp(() => resetMocktailState());
  setUp(() => reset(dioAdapterMock));
  group("SUT-getCurrentUser", () {
    test("should complete successfully when no error is thrown ✅", () async {
      dioAdapterMock.buildMockFetch(
          response: UserDto.empty().toJson(), statusCode: 200);
      expect(authRemoteSource.getCurrentUser(), completes);
      expect(await authRemoteSource.getCurrentUser(), UserDto.empty());
      verify(() => dioAdapterMock.getVerifyCall()).called(2);
      verifyNoMoreInteractions(dioAdapterMock);
    });
    test("should complete with DioException", () async {
      dioAdapterMock.buildMockFetch(
          response: UserDto.empty().toJson(), statusCode: 400);
      //Cant check below condition as is it will throw error.
      // expect(authRemoteSource.getCurrentUser(), completes);

      expect(authRemoteSource.getCurrentUser(), throwsA(isA<DioException>()));
      verifyNever(dioAdapterMock.getVerifyCall);
      verifyNoMoreInteractions(dioAdapterMock);
    });
  });

  group("SUT-login", () {
    test("Should complete sucessfully", () async {
      dioAdapterMock.buildMockFetch(
          response: UserDto.empty().toJson(), statusCode: 200);
      expect(authRemoteSource.login(password: "", username: ""), completes);
      expect(await authRemoteSource.login(password: "", username: ""),
          UserDto.empty());
      verify(() => dioAdapterMock.getVerifyCall()).called(2);
      verifyNoMoreInteractions(dioAdapterMock);
    });
    test("Should complete with error", () async {
      dioAdapterMock.buildMockFetch(
          response: UserDto.empty().toJson(), statusCode: 400);
      //Cant check below condition as is it will throw error.
      // expect(authRemoteSource.login(password: "", username: ""), completes);
      expect(authRemoteSource.login(password: "", username: ""),
          throwsA(isA<DioException>()));
      verifyNever(dioAdapterMock.getVerifyCall);
      verifyNoMoreInteractions(dioAdapterMock);
    });
  });
}
