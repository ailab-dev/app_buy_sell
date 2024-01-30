import 'package:app_buy_sell/src/features/product/domain/app_store_review_model.dart';

class ProductInfoModel {
  double rate = 0;
  List<AppstoreReviewEntry> reviewList = [];

  String get rateString {
    return rate.toStringAsFixed(1);
  }
}
