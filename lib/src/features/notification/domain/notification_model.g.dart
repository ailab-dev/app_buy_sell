// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      content: json['content'] as String,
      title: json['title'] as String,
      iconUrl: json['iconUrl'] as String?,
      appId: json['appId'] as String?,
      appName: json['appName'] as String?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'content': instance.content,
      'title': instance.title,
      'iconUrl': instance.iconUrl,
      'appId': instance.appId,
      'appName': instance.appName,
      'userId': instance.userId,
      'userName': instance.userName,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.newApp: 'newApp',
  NotificationType.purchase: 'purchase',
};
