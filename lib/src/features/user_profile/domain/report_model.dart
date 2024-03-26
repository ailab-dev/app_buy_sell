import 'package:app_buy_sell/src/utils/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.g.dart';
part 'report_model.freezed.dart';

@freezed
class ReportModel with _$ReportModel {
  factory ReportModel({
    required String user,
    required String targetUser,
    required List<String> reportType,
    required String content,
    @TimestampConverter() required DateTime createdAt,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);
}
