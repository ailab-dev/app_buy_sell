import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/upload_app_controller.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class AppPricePage extends HookConsumerWidget {
  const AppPricePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadController = ref.watch(uploadAppControllerProvider);
    final priceController = useTextEditingController();
    priceController.text = uploadController.price;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Utils.dismissKeyboard(context);
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'STEP3/3',
                style: TextStyle(
                  color: ColorsConstant.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'アプリの販売価格を設定してください',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsConstant.text),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: '販売される方は、',
                  style: const TextStyle(
                    color: ColorsConstant.gray3,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: '販売時の注意点',
                      style: const TextStyle(
                        color: ColorsConstant.defaultLinkBlue,
                        decoration: TextDecoration.underline,
                        fontSize: 10,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(
                      text: 'を必ず承知の上登録してください。',
                      style: TextStyle(
                        color: ColorsConstant.gray3,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 197,
                    child: TextField(
                      controller: priceController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.gray2,
                        ),
                        fillColor: ColorsConstant.gray,
                        filled: true,
                      ),
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref
                            .read(uploadAppControllerProvider.notifier)
                            .setAppPrice(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '円',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorsConstant.text,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    height: 47,
                    child: TextButton(
                      onPressed: () {
                        ref
                            .read(uploadAppControllerProvider.notifier)
                            .backPage();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            width: 1,
                            color: ColorsConstant.text,
                            style: BorderStyle.solid,
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text(
                        '戻る',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorsConstant.text,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 47,
                    child: TextButton(
                      onPressed: uploadController.appPriceValidate
                          ? () {
                              Utils.dismissKeyboard(context);
                              showDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                barrierDismissible: false,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text(
                                    'アプリを公開します',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  content: const Text(
                                    '入力いただいた内容でアプリを公開してよろしいでしょうか？',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  actions: [
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: CupertinoDialogAction(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text(
                                          '公開する',
                                          style: TextStyle(
                                            color:
                                                ColorsConstant.defaultLinkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: CupertinoDialogAction(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text(
                                          'キャンセル',
                                          style: TextStyle(
                                            color: ColorsConstant.gray2,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          : null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          uploadController.appPriceValidate
                              ? ColorsConstant.text
                              : ColorsConstant.gray2,
                        ),
                      ),
                      child: const Text(
                        '公開する',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
