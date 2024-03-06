import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_model.freezed.dart';

part 'setting_model.g.dart';

@freezed
class SettingModel with _$SettingModel {
  factory SettingModel({
    @Default(true) bool enableNotification,
    @Freezed(toJson: false, fromJson: false) @Default(false) bool deleteAccount,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}
