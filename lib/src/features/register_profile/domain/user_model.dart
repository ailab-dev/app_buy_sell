import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String userName;

  @JsonKey(
    fromJson: Utils.fromTimestamp,
    toJson: Utils.toTimestamp,
  )
  DateTime? createdAt;

  @JsonKey(defaultValue: '')
  String description = '';

  @JsonKey(defaultValue: '')
  String nickName = '';

  @JsonKey(defaultValue: '')
  String twitter = '';
  @JsonKey(defaultValue: '')
  String facebook = '';
  @JsonKey(defaultValue: '')
  String github = '';
  @JsonKey(defaultValue: '')
  String portfolio = '';

  UserModel(
    this.id,
    this.userName,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
