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
    required double price,
    required String id,
    String? iosId,
    String? androidId,
    required List<String> banner,
    @TimestampConverter() required DateTime createdAt,
  }) = _AppModel;

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);

  String get priceText {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'ja',
    );
    return formatter.format(price);
  }
}
