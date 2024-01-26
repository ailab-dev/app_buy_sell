import 'package:app_buy_sell/model/app_store_review_model.dart';
import 'package:app_buy_sell/service/base_api_request.dart';

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
