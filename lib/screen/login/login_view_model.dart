import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:app_buy_sell/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel {
  final LoginService _loginService = LoginService();
  String? passErr;
  String? emailErr;

  String password = '';
  String email = '';

  bool enable = false;

  bool validate() {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(password)) {
      passErr = '小文字・大文字・数字を含めた8桁以上';
    } else {
      passErr = null;
    }
    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegex.hasMatch(email)) {
      emailErr = 'メール アドレスの形式が正しくありません。';
    } else {
      emailErr = null;
    }
    if (passErr == null && emailErr == null) {
      enable = true;
      return true;
    } else {
      enable = false;
    }
    notifyListeners();
    return enable;
  }

  Future<AccountStatus?> loginAccount(String email, String password) async {
    if (!validate()) {
      return null;
    }
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final status = await _loginService.checkAccountStatus();
      isLoading = false;
      notifyListeners();
      return status;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      addError(e);
      return null;
    }
  }
}
