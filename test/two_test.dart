// https://medium.com/@foxanna/assertions-in-dart-and-flutter-tests-equality-matchers-aced54e7a3f5

//Equal and matcher

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Expect: value", () {
    const result = 0;
    //equals is a predefined matcher [it matches equlaity of two values but not its refrence].
    expect(result, equals(0));
  });
  test("Expect: value", () {
    const result = 0;
    //same is a predefined matcher [it matches equlaity of two refrences so two values needs to be const].
    expect(result, same(02));
  });
  test(
    "Expect value to be true",
    () {
      const isMale = false;
      expect(isMale, isTrue, reason: "Person is not male");
    },
  );

  test(
    "Check for boolean",
    () {
      expect(2 > 3, isFalse);
    },
  );

  test(
    "Expect vaklue to be false",
    () {
      const isMale = false;
      expect(isMale, isFalse);
    },
  );

  test(
    "Check if value is null",
    () {
      const canUpdate = null;
      expect(canUpdate, isNull);
    },
  );

  test(
    "Check if not null",
    () {
      const canUpdate = null;
      expect(canUpdate, isNotNull);
    },
  );

  test(
    "Check if value is anything",
    () {
      const dummyValue = null;
      expect(dummyValue, anything);
    },
  );
}
