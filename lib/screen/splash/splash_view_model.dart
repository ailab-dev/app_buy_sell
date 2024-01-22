import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:app_buy_sell/service/login_service.dart';

class SplashViewModel extends BaseViewModel {
  final LoginService _loginService = LoginService();

  Future<AccountStatus> checkAccount() async {
    try {
      var status = await _loginService.checkAccountStatus();
      notifyListeners();
      return status;
    } catch (_) {
      return AccountStatus.unlogined;
    }
  }
}
