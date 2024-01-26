import 'package:json_annotation/json_annotation.dart';

part 'app_store_info_model.g.dart';

@JsonSerializable()
class AppStoreInfoModel {
  List<AppStoreInfoResult?> results;
  AppStoreInfoModel(this.results);

  factory AppStoreInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AppStoreInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppStoreInfoModelToJson(this);
}

@JsonSerializable()
class AppStoreInfoResult {
  double? averageUserRating;

  AppStoreInfoResult();

  factory AppStoreInfoResult.fromJson(Map<String, dynamic> json) =>
      _$AppStoreInfoResultFromJson(json);

  Map<String, dynamic> toJson() => _$AppStoreInfoResultToJson(this);
}
