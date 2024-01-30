import 'package:app_buy_sell/src/features/product/application/app_store_customer_review_service.dart';
import 'package:app_buy_sell/src/features/product/application/app_store_info_service.dart';
import 'package:app_buy_sell/src/features/product/domain/product_info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_info_provider.g.dart';

@riverpod
class AppInfo extends _$AppInfo {
  final AppStoreInfoService _appStoreInfoService = AppStoreInfoService();

  final AppstoreCustomerReviewService _appstoreCustomerReviewService =
      AppstoreCustomerReviewService();

  @override
  FutureOr<ProductInfoModel?> build(String? appId) async {
    return await getAppInfo(appId);
  }

  Future<ProductInfoModel?> getAppInfo(String? appId) async {
    if (appId != null) {
      state = const AsyncValue.loading();
      try {
        final info = await _appStoreInfoService.getAppStoreInfo(appId);
        final rate = info.results.firstOrNull?.averageUserRating ?? 0;
        final review = await _appstoreCustomerReviewService.getReviews(appId);
        final reviewList = review.feed?.entry ?? [];
        ProductInfoModel productInfoModel = ProductInfoModel();
        productInfoModel.rate = rate;
        productInfoModel.reviewList = reviewList;
        state = AsyncValue.data(productInfoModel);
        return productInfoModel;
      } catch (err, stack) {
        state = AsyncValue.error(err, stack);
      }
    }
    return null;
  }
}
