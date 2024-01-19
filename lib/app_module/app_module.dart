import 'package:app_buy_sell/screen/login/login_view_model.dart';
import 'package:app_buy_sell/screen/register/register_view_model.dart';
import 'package:koin/koin.dart';

class Modules {
  static var viewModelModule = Module()
    ..factory((scope) => LoginViewModel())
    ..factory((scope) => RegisterViewModel());
}
