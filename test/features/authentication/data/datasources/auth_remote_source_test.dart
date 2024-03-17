import 'dart:convert';

import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';

// class DioAdapterMock extends Mock implements HttpClientAdapter {}

class DioAdapterMock extends Mock implements HttpClientAdapter {}

const dioHttpHeadersForResponseBody = {
  Headers.contentTypeHeader: [Headers.jsonContentType],
};
void main() {
  // final dioMock = DioMock();
  final Dio dio = Dio();
  late DioAdapterMock dioAdapterMock;

  late AuthRemoteSource authRemoteSource;
  setUpAll(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    authRemoteSource = AuthRemoteSource(dio);
    registerFallbackValue(RequestOptions());
  });
  //

  test("Testing", () async {
    when(() => dioAdapterMock.fetch(any(), any(), any())).thenAnswer(
        (invocation) async => Future.value(ResponseBody.fromString(
            json.encode(UserDto.empty().toJson()), 200,
            headers: dioHttpHeadersForResponseBody)));

    // expect(authRemoteSource.getCurrentUser(), completes);
    // expect(await authRemoteSource.getCurrentUser(), UserDto.empty());
    // expect(await authRemoteSource.getCurrentUser(),
    //     throwsException); // expect(actual, matcher)

    // expect(() => name(), throwsException);
    // expect(
    //     () async => await authRemoteSource.getCurrentUser(), throwsException);

    // expectAsync0(() async {
    //   try {
    //     await authRemoteSource.getCurrentUser();
    //   } catch (e) {
    //     expect(e, isA<DioException>());
    //   }
    // });
    // TypeMatcher<DioException>();

    // expect(() async => await authRemoteSource.getCurrentUser(),
    //     const TypeMatcher<DioException>());

    // expect(() async => await authRemoteSource.getCurrentUser(),
    //     throwsA(isA<DioException>()));

    // expect(actual, matcher);

    // expect(actual, matcher);
  });
}

name() {
  throw Exception();
}
