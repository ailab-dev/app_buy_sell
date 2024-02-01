// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) => AppModel(
      json['name'] as String,
      json['description'] as String,
      json['iconUrl'] as String,
      (json['price'] as num?)?.toDouble() ?? 0,
      json['id'] as String,
    )
      ..iosId = json['iosId'] as String?
      ..androidId = json['androidId'] as String?
      ..createdAt = Utils.fromTimestamp(json['createdAt'] as Timestamp?)
      ..banner = (json['banner'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [];

Map<String, dynamic> _$AppModelToJson(AppModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'iosId': instance.iosId,
      'androidId': instance.androidId,
      'id': instance.id,
      'price': instance.price,
      'createdAt': Utils.toTimestamp(instance.createdAt),
      'banner': instance.banner,
    };
