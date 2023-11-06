import 'package:json_annotation/json_annotation.dart';
import "address.dart";
import "name.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      // {required this.id,
      // required this.firstName,
      // required this.lastName,
      // required this.password,
      // required this.createAt,
      // required this.cuser}
      );
  late num id;
  late String firstName;
  late String lastName;
  late String password;
  late String createAt;
  late String cuser;

  // final num id;
  // final String firstName;
  // final String lastName;
  // final String password;
  // final String createAt;
  // final String cuser;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
