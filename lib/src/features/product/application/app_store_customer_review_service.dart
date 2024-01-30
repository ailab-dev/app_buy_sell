import 'package:app_buy_sell/src/features/product/application/base_api_request.dart';
import 'package:app_buy_sell/src/features/product/domain/app_store_review_model.dart';

class AppstoreCustomerReviewService with BaseApi {
  Future<AppstoreReviewModel> getReviews(String appId) async {
    return await request<AppstoreReviewModel>(
      'https://itunes.apple.com/jp/rss/customerreviews/id=$appId/sortBy=mostRecent/json',
      (json) => AppstoreReviewModel.fromJson(json),
      showLog: false,
      method: MethodHTTP.get,
    );
  }
}
