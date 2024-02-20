// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String,
      json['userName'] as String,
    )
      ..createdAt = Utils.fromTimestamp(json['createdAt'] as Timestamp?)
      ..description = json['description'] as String? ?? ''
      ..nickName = json['nickName'] as String? ?? ''
      ..twitter = json['twitter'] as String? ?? ''
      ..facebook = json['facebook'] as String? ?? ''
      ..github = json['github'] as String? ?? ''
      ..portfolio = json['portfolio'] as String? ?? '';

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'createdAt': Utils.toTimestamp(instance.createdAt),
      'description': instance.description,
      'nickName': instance.nickName,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'github': instance.github,
      'portfolio': instance.portfolio,
    };
