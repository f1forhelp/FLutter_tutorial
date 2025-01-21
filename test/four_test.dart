import 'package:flutter_test/flutter_test.dart';

void main() {
  //Collection matcher
  test(
    "expect: isNotEmpty",
    () {
      expect([], isNotEmpty);
    },
  );
  test(
    "expect: isEmpty",
    () {
      expect([], isEmpty);
    },
  );

  test(
    "expect: lengthToBe4 ",
    () {
      var ls = [2];
      expect(ls, isList);
      expect(ls, hasLength(1));
    },
  );
}
