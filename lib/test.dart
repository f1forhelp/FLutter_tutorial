import 'package:flutter_tutorial/features/authentication/domain/entity/user/user.dart';

void main() {
  User user3 = User();
  print(user3);

  print(User.fromJson({"userName": null}).userName.toString());
}
