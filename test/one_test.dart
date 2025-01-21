import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
// https://medium.com/@foxanna/assertions-in-dart-and-flutter-tests-expect-and-matcher-99ad3a99b4b8

// Expect And Matcher

void main() {
  test('expect value - 1', () {
    const result = 0;
    expect(result, 0);
  });
  test("expected value - 2", () {
    const result = 1;
    expect(result, 0, reason: "The result should be 0");
  });
  test("expected value - 3", () {
    const result = 1;
    expect(
      result, 0, reason: "The result should be 0",
      // skip: true,
    );
  });
}
