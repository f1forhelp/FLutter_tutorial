import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart'; //For freezed file only.
part 'cart_model.g.dart'; //Add this if you want to add json serializable.

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({required String orderNo, String? name}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  String getConcatedResult() => orderNo + (name ?? "");
}
