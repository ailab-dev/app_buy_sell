import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:app_buy_sell/service/user_service.dart';

class RegisterProfileViewModel extends BaseViewModel {
  final UserService _userService = UserService();
  bool enable = false;
  String userName = '';

  void setName(String value) {
    userName = value;
    if (userName.isNotEmpty) {
      enable = true;
    } else {
      enable = false;
    }
    notifyListeners();
  }

  Future<bool> registerProfile() async {
    try {
      isLoading = true;
      notifyListeners();
      await _userService.createUserProfile(userName);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      addError(e);
      return false;
    }
  }
}
