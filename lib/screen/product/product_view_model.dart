import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:app_buy_sell/model/app_store_review_model.dart';
import 'package:app_buy_sell/service/app_store_customer_review_service.dart';
import 'package:app_buy_sell/service/app_store_info_service.dart';

class ProductViewModel extends BaseViewModel {
  final AppStoreInfoService _appStoreInfoService = AppStoreInfoService();

  final AppstoreCustomerReviewService _appstoreCustomerReviewService =
      AppstoreCustomerReviewService();

  double rate = 0;

  List<AppstoreReviewEntry> reviewList = [];

  String get rateString {
    return rate.toStringAsFixed(1);
  }

  Future<void> getAppInfo(String? appId) async {
    if (appId != null) {
      try {
        isLoading = true;
        notifyListeners();
        final info = await _appStoreInfoService.getAppStoreInfo(appId);
        rate = info.results.firstOrNull?.averageUserRating ?? 0;
        final review = await _appstoreCustomerReviewService.getReviews(appId);
        reviewList = review.feed?.entry ?? [];
        isLoading = false;
        notifyListeners();
      } catch (e) {
        addError(e);
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
