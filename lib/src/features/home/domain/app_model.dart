import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_model.g.dart';

@JsonSerializable()
class AppModel {
  String name;
  String description;
  String iconUrl;

  @JsonKey(
    fromJson: Utils.fromTimestamp,
    toJson: Utils.toTimestamp,
  )
  DateTime? createdAt;
  AppModel(this.name, this.description, this.iconUrl);

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
