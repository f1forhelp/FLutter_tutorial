import 'dart:io';

import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tutorial/core/unions/exception/exception.dart';

class NetworkUtil {
  static final NetworkUtil _obj = NetworkUtil._internal();
  NetworkUtil._internal();
  factory NetworkUtil() => _obj;

  Future<ApiResult<T>> wrapRequest<T>(
      Future<T> Function() execcutionContext) async {
    try {
      var r = await execcutionContext();
      return ApiResult.sucess(r);
    } catch (e) {
      if (e is SocketException) {
        return ApiResult.failure(
          CallException.other(
              exceptionType: ExceptionType.socket,
              message: "Seems like your internet is not working."),
        );
      }
      if (e is FormatException) {
        return ApiResult.failure(CallException.other(
            exceptionType: ExceptionType.format,
            message: "Some format exception"));
      }
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          return ApiResult.failure(CallException.api(
              statusCode: e.response?.statusCode ?? 0,
              message: e.message ?? ""));
        } else {
          return ApiResult.failure(CallException.api(
              statusCode: e.response?.statusCode ?? 0,
              message: e.message ?? ""));
        }
      } else {
        return ApiResult.failure(CallException.other(
          message: e.toString(),
          exceptionType: ExceptionType.other,
        ));
      }
    }
  }
}
