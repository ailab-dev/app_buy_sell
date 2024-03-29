import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/constants/constant.dart';
import 'package:app_buy_sell/src/features/login/email_validate_provider.dart';
import 'package:app_buy_sell/src/features/login/pass_validate_provider.dart';
import 'package:app_buy_sell/src/features/register/register_acc_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final emailError = ref.watch(emailValidateProvider);
    final passError = ref.watch(passValidateProvider);
    final registerStatus = ref.watch(registerAccountProvider);

    ref.listen(registerAccountProvider, (previous, next) {
      next.when(
        data: (result) {
          if (result) {
            context.push('/registerProfile');
          }
        },
        error: (e, stackTrace) {
          Utils.showAlertError(error: e, context: context);
        },
        loading: () {},
      );
    });

    return LoadingView(
      isLoading: registerStatus.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Utils.dismissKeyboard(context);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'AppBuySellをはじめる',
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
                    controller: emailController,
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
                    controller: passwordController,
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
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: '', children: [
                        TextSpan(
                          text: '利用規約',
                          style: const TextStyle(
                            color: ColorsConstant.purple,
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrlString(Constant.termUrl);
                            },
                        ),
                        const TextSpan(
                          text: '及び',
                          style: TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'プライバシーポリシー',
                          style: const TextStyle(
                            color: ColorsConstant.purple,
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrlString(Constant.policyUrl);
                            },
                        ),
                        const TextSpan(
                          text: 'に同意の上、ご登録へお進みください。',
                          style: TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: TextButton(
                      onPressed: () async {
                        Utils.dismissKeyboard(context);
                        ref
                            .read(passValidateProvider.notifier)
                            .validate(passwordController.text);
                        ref
                            .read(emailValidateProvider.notifier)
                            .validate(emailController.text);
                        final emailV = ref.read(emailValidateProvider);
                        final passV = ref.read(passValidateProvider);
                        if (emailV == null && passV == null) {
                          ref.read(registerAccountProvider.notifier).register(
                              emailController.text, passwordController.text);
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
                        '新規登録してはじめる',
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
}
