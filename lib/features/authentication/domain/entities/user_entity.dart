// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final int age;
  const UserEntity({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}
