// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      json['id'] as String,
      $enumDecode(_$NotificationTypeEnumMap, json['type']),
      json['content'] as String,
      json['title'] as String,
    )
      ..userId = json['userId'] as String?
      ..createdAt = Utils.fromTimestamp(json['createdAt'] as Timestamp?);

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'content': instance.content,
      'title': instance.title,
      'userId': instance.userId,
      'createdAt': Utils.toTimestamp(instance.createdAt),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.newApp: 'newApp',
  NotificationType.purchase: 'purchase',
};
