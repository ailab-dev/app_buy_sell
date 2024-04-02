// ignore_for_file: invalid_annotation_target

import 'package:app_buy_sell/src/utils/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'app_model.g.dart';

part 'app_model.freezed.dart';

@freezed
class AppModel with _$AppModel {
  const AppModel._();
  factory AppModel({
    required String name,
    required String description,
    required String iconUrl,
    required String price,
    required String id,
    String? appStoreUrl,
    String? gPlayUrl,
    required List<String> banner,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool didPay,
    @JsonKey(includeFromJson: false, includeToJson: false) bool? paySuccess,
    @TimestampConverter() required DateTime createdAt,
    @Default('') String ownerId,
    @Default('') String catchphrase,
    CategoryType? categoryType,
  }) = _AppModel;

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);

  String get priceText {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'ja',
    );
    return formatter.format(int.parse(price));
  }
}

enum CategoryType {
  books,
  business,
  developer,
  education,
  entertainment,
  finance,
  food,
  games,
  design,
  health,
  lifestyle,
  magazines,
  medical,
  music,
  navigation,
  news,
  photo,
  productivity,
  reference,
  shopping,
  socialNetwork,
  sports,
  stickers,
  travel,
  utilities,
  weather,
}

extension CategoryTypeeEx on CategoryType {
  String get typeName {
    switch (this) {
      case CategoryType.books:
        return 'Books';
      case CategoryType.business:
        return 'Business';
      case CategoryType.developer:
        return 'Developer Tools';
      case CategoryType.education:
        return 'Education';
      case CategoryType.entertainment:
        return 'Entertainment';
      case CategoryType.finance:
        return 'Finance';
      case CategoryType.food:
        return 'Food & Drink';
      case CategoryType.design:
        return 'Graphics & Design';
      case CategoryType.health:
        return 'Health & Fitness';
      case CategoryType.lifestyle:
        return 'Lifestyle';
      case CategoryType.magazines:
        return 'Magazines & Newspapers';
      case CategoryType.medical:
        return 'Medical';
      case CategoryType.music:
        return 'Music';
      case CategoryType.navigation:
        return 'Navigation';
      case CategoryType.news:
        return 'News';
      case CategoryType.photo:
        return 'Photo & Video';
      case CategoryType.productivity:
        return 'Productivity';
      case CategoryType.reference:
        return 'Reference';
      case CategoryType.shopping:
        return 'Shopping';
      case CategoryType.socialNetwork:
        return 'Social Networking';
      case CategoryType.sports:
        return 'Sports';
      case CategoryType.stickers:
        return 'Stickers';
      case CategoryType.travel:
        return 'Travel';
      case CategoryType.utilities:
        return 'Utilities';
      case CategoryType.weather:
        return 'Weather';
      case CategoryType.games:
        return 'Games';
    }
  }
}
