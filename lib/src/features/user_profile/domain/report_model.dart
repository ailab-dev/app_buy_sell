import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  String user;
  String reportedUser;
  List<String> reportType;
  String content;

  @JsonKey(
    fromJson: Utils.fromTimestamp,
    toJson: Utils.toTimestamp,
  )
  DateTime? createdAt;

  ReportModel(this.user, this.reportedUser, this.reportType, this.content);

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}
