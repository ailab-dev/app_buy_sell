import 'package:app_buy_sell/src/features/setting/domain/setting_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    required String id,
    required String userName,
    @Default('') String description,
    @Default('') String nickName,
    @Default('') String twitter,
    @Default('') String facebook,
    @Default('') String github,
    @Default('') String portfolio,
    @Default('') String instagram,
    String? country,
    SettingModel? setting,

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
