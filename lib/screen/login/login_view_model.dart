import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel {
  Future<bool> loginAccount(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
