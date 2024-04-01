// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingModelImpl _$$SettingModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingModelImpl(
      enableNotification: json['enableNotification'] as bool? ?? true,
      deleteAccount: json['deleteAccount'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingModelImplToJson(_$SettingModelImpl instance) =>
    <String, dynamic>{
      'enableNotification': instance.enableNotification,
      'deleteAccount': instance.deleteAccount,
    };
