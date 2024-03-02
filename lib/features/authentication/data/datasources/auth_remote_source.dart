import 'dart:convert';

import 'package:flutter_tutorial/core/constants/api.dart';
import 'package:flutter_tutorial/core/error/exception.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteSource {
  const AuthRemoteSource();

  Future<void> addUser({required String name, required int age});
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser({required int userId});
}

class AuthRemoteSourceImp implements AuthRemoteSource {
  AuthRemoteSourceImp(this._client);
  final http.Client _client;

  @override
  Future<void> addUser({required String name, required int age}) async {
    try {
      final res = await _client.post(
        Uri.https(KApi.baseUrl, KApi.user),
        body: jsonEncode({
          "name": name,
          "age": age,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (res.statusCode >= 300 || res.statusCode < 200) {
        throw ApiException(
          statusCode: res.statusCode,
          message: res.body,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final res = await _client.get(
        Uri.https(KApi.baseUrl, KApi.user),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (res.statusCode >= 300 || res.statusCode < 200) {
        throw ApiException(
          statusCode: res.statusCode,
          message: res.body,
        );
      }
      return (jsonDecode(res.body) as List)
          .map((e) => UserModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<UserModel> getUser({required int userId}) async {
    try {
      final res = await _client.get(
        Uri.https(KApi.baseUrl, "${KApi.user}/$userId"),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (res.statusCode >= 300 || res.statusCode < 200) {
        throw ApiException(
          statusCode: res.statusCode,
          message: res.body,
        );
      }
      return UserModel.fromMap(jsonDecode(res.body) as Map<String, dynamic>);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
