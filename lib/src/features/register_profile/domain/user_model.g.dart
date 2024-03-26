// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      description: json['description'] as String? ?? '',
      nickName: json['nickName'] as String? ?? '',
      twitter: json['twitter'] as String? ?? '',
      facebook: json['facebook'] as String? ?? '',
      github: json['github'] as String? ?? '',
      portfolio: json['portfolio'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      country: json['country'] as String?,
      setting: json['setting'] == null
          ? null
          : SettingModel.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'description': instance.description,
      'nickName': instance.nickName,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'github': instance.github,
      'portfolio': instance.portfolio,
      'instagram': instance.instagram,
      'country': instance.country,
      'setting': instance.setting?.toJson(),
    };
