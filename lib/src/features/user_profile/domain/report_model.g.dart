// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      json['user'] as String,
      json['reportedUser'] as String,
      (json['reportType'] as List<dynamic>).map((e) => e as String).toList(),
      json['content'] as String,
    )..createdAt = Utils.fromTimestamp(json['createdAt'] as Timestamp?);

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'reportedUser': instance.reportedUser,
      'reportType': instance.reportType,
      'content': instance.content,
      'createdAt': Utils.toTimestamp(instance.createdAt),
    };
