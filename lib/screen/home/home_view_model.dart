import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:app_buy_sell/model/app_model.dart';
import 'package:app_buy_sell/service/app_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final AppService _appService = AppService();

  List<AppModel> appList = [];

  Future<void> getApps() async {
    try {
      var response = await _appService.getApps();
      var data = response.$1;
      appList = data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
      errorSubject.add(e);
      debugPrint(e.toString());
    }
  }
}
