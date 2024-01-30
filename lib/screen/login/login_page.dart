import 'package:app_buy_sell/screen/home/home_page.dart';
import 'package:app_buy_sell/screen/login/email_validate_provider.dart';
import 'package:app_buy_sell/screen/login/login_provider.dart';
import 'package:app_buy_sell/screen/login/pass_validate_provider.dart';
import 'package:app_buy_sell/screen/register_profile/register_profile_page.dart';
import 'package:app_buy_sell/service/login_service.dart';
import 'package:app_buy_sell/utils/loading_view.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:app_buy_sell/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailError = ref.watch(emailValidateProvider);
    final passError = ref.watch(passValidateProvider);
    final loginStatus = ref.watch(loginProvider);

    ref.listen(loginProvider, (previous, next) {
      next.when(
        data: (result) {
          if (result == AccountStatus.profileUnRegistered) {
            Navigation.pushAndRemoveUntil(context, const RegisterProfilePage());
          } else if (result == AccountStatus.logined) {
            Navigation.pushAndRemoveUntil(context, const HomePage());
          }
        },
        error: (e, stackTrace) {
          Utils.showAlert(error: e, context: context);
        },
        loading: () {},
      );
    });

    return LoadingView(
      isLoading: loginStatus.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Utils.dismisKeyboard(context);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'ログイン',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Text(
                    'メールアドレス',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      fillColor: ColorsConstant.gray,
                      filled: true,
                      hintText: 'your-email@prodhub.com',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: ColorsConstant.gray2,
                      ),
                      errorText: emailError,
                    ),
                    onChanged: (value) {
                      ref.read(emailValidateProvider.notifier).validate(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'パスワード',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      fillColor: ColorsConstant.gray,
                      filled: true,
                      hintText: '小文字・大文字・数字を含めた8桁以上',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: ColorsConstant.gray2,
                      ),
                      errorText: passError,
                    ),
                    onChanged: (value) {
                      ref.read(passValidateProvider.notifier).validate(value);
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: TextButton(
                      onPressed: () async {
                        Utils.dismisKeyboard(context);
                        ref
                            .read(passValidateProvider.notifier)
                            .validate(_passwordController.text);
                        ref
                            .read(emailValidateProvider.notifier)
                            .validate(_emailController.text);
                        final emailV = ref.read(emailValidateProvider);
                        final passV = ref.read(passValidateProvider);
                        if (emailV == null && passV == null) {
                          ref.read(loginProvider.notifier).login(
                              _emailController.text, _passwordController.text);
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(ColorsConstant.text),
                      ),
                      child: const Text(
                        'ログインする',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
