import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/register_profile/register_profile_provider.dart';
import 'package:app_buy_sell/src/features/register_profile/register_validate_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterProfilePage extends HookConsumerWidget {
  const RegisterProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();

    final validate = ref.watch(registerValidateProvider);
    final register = ref.watch(registerProfileProvider);
    ref.listen(registerProfileProvider, (previous, next) {
      next.when(
        data: (result) {
          if (result) {
            context.go('/home');
          }
        },
        error: (error, stackTrace) {
          Utils.showAlertError(context: context, error: error);
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
                    controller: nameController,
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
                              Utils.dismissKeyboard(context);
                              ref
                                  .read(registerProfileProvider.notifier)
                                  .register(nameController.text.trim());
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
}
