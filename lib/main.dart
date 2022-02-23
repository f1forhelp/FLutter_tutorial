import 'package:flutter_tutorial/freezed/freezed_with_json_serializable/cart_model.dart';

import 'freezed/only_freezed/user_model.dart';

void main() {
  //--------------Only Freezed ----------
  const user1 = User(name: "Utkarsh");
  const user2 = User(name: "Utkarsh");
  print(user2 == user1); //OP: true
  print(user1);
  print(user2);
  var user3 = user2.copyWith(name: "Sharma");
  print(user3);

  //-----------------Freezed With Json Serializable -------------
  var cartModel = Cart(orderNo: "This is Order No ");
  cartModel = cartModel.copyWith(name: "Utkarsh");
  print(cartModel.toJson());
  print(cartModel.getConcatedResult());

  var cartModelFromJson =
      Cart.fromJson({"name": "utkarsh", "order_id": "this is underScore Id"});
  print(cartModelFromJson.name);
  print(cartModelFromJson.toJson());
  print(cartModelFromJson.toString());
}
