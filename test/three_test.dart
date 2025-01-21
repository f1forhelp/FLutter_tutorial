import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "expect: isA int",
    () {
      const dynamicValue = 23;
      expect(dynamicValue, isA<int>());
    },
  );
  test(
    "expect: isA map",
    () {
      var dynamicValue = jsonDecode('{"name":"John", "age":30, "car":null}');
      expect(dynamicValue, isA<Map>());
    },
  );
  test(
    "expect: isA list",
    () {
      var dynamicValue = jsonDecode('[]');
      expect(dynamicValue, isA<List>());
    },
  );

  test(
    "expect: isList",
    () {
      expect([], isList);
    },
  );

  test(
    "expect: isMap",
    () {
      expect({}, isMap);
    },
  );

  test(
    "expect: custom matcher",
    () {
      const isCMap = TypeMatcher<Map>();
      expect({}, isCMap);
    },
  );

  test(
    "expect: custom matcheer 1",
    () {
      const isCorrectVal = 2;
      expect(isCorrectVal, CustomInt());
    },
  );

  test(
    "expect: isUnimplementedError",
    () {
      expect(UnimplementedError(), isUnimplementedError);
    },
  );
  test(
    "expect: isNBoSuchMethod",
    () {
      res() {
        (2 as dynamic).length;
      }

      expect(res, throwsA(isNoSuchMethodError));
    },
  );
}

class CustomInt extends Matcher {
  @override
  Description describe(Description description) {
    return description.add("Test Description");
  }

  @override
  bool matches(item, Map matchState) {
    return item is int && item == 2;
  }
}
