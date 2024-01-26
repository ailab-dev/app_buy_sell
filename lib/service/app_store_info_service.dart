import 'package:app_buy_sell/model/app_store_info_model.dart';
import 'package:app_buy_sell/service/base_api_request.dart';

class AppStoreInfoService with BaseApi {
  Future<AppStoreInfoModel> getAppStoreInfo(String appId) async {
    return await request<AppStoreInfoModel>(
      'https://itunes.apple.com/jp/lookup?id=$appId',
      (json) => AppStoreInfoModel.fromJson(json),
      showLog: false,
      method: MethodHTTP.get,
    );
  }
}
