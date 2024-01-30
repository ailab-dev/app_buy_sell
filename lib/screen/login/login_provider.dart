import 'package:app_buy_sell/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  final LoginService _loginService = LoginService();

  @override
  FutureOr<AccountStatus> build() async {
    return AccountStatus.unlogined;
  }  

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final status = await _loginService.checkAccountStatus();
      state = AsyncValue.data(status);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
