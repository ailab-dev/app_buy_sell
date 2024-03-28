// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppModelImpl _$$AppModelImplFromJson(Map<String, dynamic> json) =>
    _$AppModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      price: json['price'] as String,
      id: json['id'] as String,
      appStoreUrl: json['appStoreUrl'] as String?,
      gPlayUrl: json['gPlayUrl'] as String?,
      banner:
          (json['banner'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      ownerId: json['ownerId'] as String? ?? '',
      catchphrase: json['catchphrase'] as String? ?? '',
      categoryType:
          $enumDecodeNullable(_$CategoryTypeEnumMap, json['categoryType']),
    );

Map<String, dynamic> _$$AppModelImplToJson(_$AppModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'price': instance.price,
      'id': instance.id,
      'appStoreUrl': instance.appStoreUrl,
      'gPlayUrl': instance.gPlayUrl,
      'banner': instance.banner,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'ownerId': instance.ownerId,
      'catchphrase': instance.catchphrase,
      'categoryType': _$CategoryTypeEnumMap[instance.categoryType],
    };

const _$CategoryTypeEnumMap = {
  CategoryType.books: 'books',
  CategoryType.business: 'business',
  CategoryType.developer: 'developer',
  CategoryType.education: 'education',
  CategoryType.entertainment: 'entertainment',
  CategoryType.finance: 'finance',
  CategoryType.food: 'food',
  CategoryType.games: 'games',
  CategoryType.design: 'design',
  CategoryType.health: 'health',
  CategoryType.lifestyle: 'lifestyle',
  CategoryType.magazines: 'magazines',
  CategoryType.medical: 'medical',
  CategoryType.music: 'music',
  CategoryType.navigation: 'navigation',
  CategoryType.news: 'news',
  CategoryType.photo: 'photo',
  CategoryType.productivity: 'productivity',
  CategoryType.reference: 'reference',
  CategoryType.shopping: 'shopping',
  CategoryType.socialNetwork: 'socialNetwork',
  CategoryType.sports: 'sports',
  CategoryType.stickers: 'stickers',
  CategoryType.travel: 'travel',
  CategoryType.utilities: 'utilities',
  CategoryType.weather: 'weather',
};
