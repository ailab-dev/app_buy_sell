// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppModelImpl _$$AppModelImplFromJson(Map<String, dynamic> json) =>
    _$AppModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      price: (json['price'] as num).toDouble(),
      id: json['id'] as String,
      iosId: json['iosId'] as String?,
      androidId: json['androidId'] as String?,
      banner:
          (json['banner'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$AppModelImplToJson(_$AppModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'price': instance.price,
      'id': instance.id,
      'iosId': instance.iosId,
      'androidId': instance.androidId,
      'banner': instance.banner,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
