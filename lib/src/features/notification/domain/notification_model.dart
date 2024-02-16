import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String id;

  NotificationType type;

  String content;

  String title;

  String? userId;

  @JsonKey(
    fromJson: Utils.fromTimestamp,
    toJson: Utils.toTimestamp,
  )
  DateTime? createdAt;

  NotificationModel(
    this.id,
    this.type,
    this.content,
    this.title,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

enum NotificationType {
  @JsonValue('newApp')
  newApp,
  @JsonValue('purchase')
  purchase,
}
