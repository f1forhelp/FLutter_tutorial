import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  late AuthRemoteSource authRemoteSource;
  late DioAdapter dioAdapter;

  setUpAll(() {
    final Dio dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    authRemoteSource = AuthRemoteSource(dioAdapter.dio);
  });
  tearDown(() {
    resetMocktailState();
  });

  group("login", () {
    test("should complete successfully with status code 200 ✅", () async {
      when(() => dioAdapter.onPost(
          any(), (server) => server.reply(200, UserDto.empty().toJson())));
      final methodCall = await authRemoteSource.getCurrentUser();
      expect(methodCall, completes);
    });

    test("", () => null);
  });
  group("Grp 2", () {
    test("", () => null);
    test("", () => null);
  });
}
