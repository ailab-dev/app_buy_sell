import 'package:app_buy_sell/src/utils/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'notification_model.g.dart';

part 'notification_model.freezed.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  factory NotificationModel({
    required String id,
    required NotificationType type,
    required String content,
    required String title,
    String? iconUrl,
    String? appId,
    String? appName,
    String? userId,
    String? userName,
    @TimestampConverter() required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  String get createText {
    final df = DateFormat('yyyy/MM/dd');
    return df.format(createdAt);
  }
}

enum NotificationType {
  @JsonValue('newApp')
  newApp,
  @JsonValue('purchase')
  purchase,
}
