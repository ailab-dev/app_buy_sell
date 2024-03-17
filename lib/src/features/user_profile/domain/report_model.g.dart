// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      user: json['user'] as String,
      targetUser: json['targetUser'] as String,
      reportType: (json['reportType'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      content: json['content'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'targetUser': instance.targetUser,
      'reportType': instance.reportType,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
