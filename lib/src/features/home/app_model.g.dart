// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) => AppModel(
      json['name'] as String,
      json['description'] as String,
      json['iconUrl'] as String,
    )..createdAt = Utils.fromTimestamp(json['createdAt'] as Timestamp?);

Map<String, dynamic> _$AppModelToJson(AppModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'createdAt': Utils.toTimestamp(instance.createdAt),
    };
