import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import "package:retrofit/retrofit.dart";
import 'package:dio/dio.dart';
part "auth_remote_source.g.dart";

@RestApi(parser: Parser.JsonSerializable)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String baseUrl}) = _AuthRemoteSource;
  static const String _featureUrl = "/auth";

  @POST(_featureUrl + "/login")
  Future<UserDto> login(
      {@Field() required String username, @Field() required String password});

  @GET(_featureUrl + "/auth/me")
  Future<UserDto> getCurrentUser();
}
