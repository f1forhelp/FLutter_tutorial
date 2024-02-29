// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_test/flutter_test.dart';

class Result {
  int statusCode;
  String message;
  Result({
    required this.statusCode,
    required this.message,
  });
}

// Creating a custom typeMatcher.
//Can be used to check for a common sucess/failure response.
const isResult = TypeMatcher<Result>();

void main() {
  test('Type test', () {
    final result = Result(statusCode: 200, message: 'Success');
    expect(result, isResult);
  });
}

class TestMatcher extends CustomMatcher {
  TestMatcher(
      String featureDescription, String featureName, Object? valueOrMatcher)
      : super(featureDescription, featureName, valueOrMatcher);
}
