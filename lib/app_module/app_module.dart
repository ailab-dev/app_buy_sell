import 'package:app_buy_sell/screen/home/home_view_model.dart';
import 'package:app_buy_sell/screen/login/login_view_model.dart';
import 'package:app_buy_sell/screen/product/product_view_model.dart';
import 'package:app_buy_sell/screen/register/register_view_model.dart';
import 'package:app_buy_sell/screen/register_profile/register_profile_view_model.dart';
import 'package:app_buy_sell/screen/splash/splash_view_model.dart';
import 'package:koin/koin.dart';

class Modules {
  static var viewModelModule = Module()
    ..factory((scope) => LoginViewModel())
    ..factory((scope) => RegisterViewModel())
    ..factory((scope) => SplashViewModel())
    ..factory((scope) => HomeViewModel())
    ..factory((scope) => RegisterProfileViewModel())
    ..factory((scope) => ProductViewModel());
}
