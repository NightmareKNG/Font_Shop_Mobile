// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['id'] as num
  ..firstName = json['firstName'] as String
  ..lastName = json['lastName'] as String
  ..password = json['password'] as String
  ..createAt = json['createAt'] as String
  ..cuser = json['cuser'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'createAt': instance.createAt,
      'cuser': instance.cuser,
    };
