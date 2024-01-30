import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/home_page.dart';
import 'package:app_buy_sell/src/features/register_profile/register_profile_provider.dart';
import 'package:app_buy_sell/src/features/register_profile/register_validate_provider.dart';
import 'package:app_buy_sell/src/utils/navigation.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterProfilePage extends ConsumerStatefulWidget {
  const RegisterProfilePage({super.key});

  @override
  RegisterProfilePageState createState() => RegisterProfilePageState();
}

class RegisterProfilePageState extends ConsumerState<RegisterProfilePage> {
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final validate = ref.watch(registerValidateProvider);
    final register = ref.watch(registerProfileProvider);
    ref.listen(registerProfileProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data) {
            Navigation.pushAndRemoveUntil(context, const HomePage());
          }
        },
        error: (error, stackTrace) {
          Utils.showAlert(context: context, error: error);
        },
        loading: () {},
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: LoadingView(
        isLoading: register.isLoading,
        child: GestureDetector(
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
                      'プロフィール登録',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const Center(
                    child: Text(
                      '新規会員登録していただきありがとうございます。\nプロフィールを入力してAppBuySellを始めましょう！\n※登録後もプロフィール編集は可能です。',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Text(
                    'ユーザーネーム',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _nameController,
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
                      hintText: '田中太郎',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: ColorsConstant.gray2,
                      ),
                    ),
                    onChanged: (value) {
                      ref
                          .read(registerValidateProvider.notifier)
                          .validate(value);
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: TextButton(
                      onPressed: validate
                          ? () async {
                              Utils.dismisKeyboard(context);
                              ref
                                  .read(registerProfileProvider.notifier)
                                  .register(_nameController.text.trim());
                            }
                          : null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(validate
                            ? ColorsConstant.text
                            : ColorsConstant.purpleGray),
                      ),
                      child: const Text(
                        'プロフィールを保存する',
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
    _nameController.dispose();
    super.dispose();
  }
}
