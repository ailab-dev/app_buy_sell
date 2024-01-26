// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppStoreInfoModel _$AppStoreInfoModelFromJson(Map<String, dynamic> json) =>
    AppStoreInfoModel(
      (json['results'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : AppStoreInfoResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppStoreInfoModelToJson(AppStoreInfoModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

AppStoreInfoResult _$AppStoreInfoResultFromJson(Map<String, dynamic> json) =>
    AppStoreInfoResult()
      ..averageUserRating = (json['averageUserRating'] as num?)?.toDouble();

Map<String, dynamic> _$AppStoreInfoResultToJson(AppStoreInfoResult instance) =>
    <String, dynamic>{
      'averageUserRating': instance.averageUserRating,
    };
