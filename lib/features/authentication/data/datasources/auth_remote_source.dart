import 'package:flutter_tutorial/features/authentication/data/models/user/user_model.dart';
import "package:retrofit/retrofit.dart";
import 'package:dio/dio.dart';
part "auth_remote_source.g.dart";

@RestApi(parser: Parser.JsonSerializable)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio) = _AuthRemoteSource;
  static const String _featureUrl = "/auth";

  @POST(_featureUrl + "/login")
  Future<UserModel> login({@Field() String username, @Field() String password});

  @GET(_featureUrl + "/auth/me")
  Future<UserModel> getCurrentUser();
}
