import 'package:app_buy_sell/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final UserService _userService = UserService();

  Future<AccountStatus> checkAccountStatus() async {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await FirebaseAuth.instance.currentUser?.reload();
        var user =
            await _userService.getUser(FirebaseAuth.instance.currentUser!.uid);
        if (user != null) {
          return AccountStatus.logined;
        } else {
          return AccountStatus.profileUnRegistered;
        }
      } catch (e) {
        return AccountStatus.unlogined;
      }
    }
    return AccountStatus.unlogined;
  }
}

enum AccountStatus {
  logined,
  profileUnRegistered,
  unlogined,
}
