import 'package:app_buy_sell/service/login_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
Future<AccountStatus> checkAccount(CheckAccountRef ref) async {
  final LoginService loginService = LoginService();
  return await loginService.checkAccountStatus();
}
