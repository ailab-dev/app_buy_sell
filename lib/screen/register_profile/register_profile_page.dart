import 'package:app_buy_sell/base/base_screen.dart';
import 'package:app_buy_sell/screen/home/home_page.dart';
import 'package:app_buy_sell/screen/register_profile/register_profile_view_model.dart';
import 'package:app_buy_sell/utils/loading_view.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:app_buy_sell/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProfilePage extends StatefulWidget {
  const RegisterProfilePage({super.key});

  @override
  State<RegisterProfilePage> createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState
    extends BaseScreen<RegisterProfilePage, RegisterProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<RegisterProfileViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: LoadingView(
              isLoading: viewModel.isLoading,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Utils.dismisKeyboard(context);
                },
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
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
                            viewModel.setName(value);
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: TextButton(
                            onPressed: viewModel.enable
                                ? () async {
                                    Utils.dismisKeyboard(context);
                                    final result =
                                        await viewModel.registerProfile();
                                    if (mounted && result) {
                                      Navigation.pushAndRemoveUntil(
                                          context, const HomePage());
                                    }
                                  }
                                : null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  viewModel.enable
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
        },
      ),
    );
  }
}
