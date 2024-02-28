import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/edit_profile/provider/edit_profile_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final twitterController = useTextEditingController();
    final facebookController = useTextEditingController();
    final githubController = useTextEditingController();
    final portfolioController = useTextEditingController();
    final countryController = useTextEditingController();

    final myProfileProfile = ref.watch(editProfileProvider);
    myProfileProfile.whenData((value) {
      userNameController.text = value?.userName ?? '';
      descriptionController.text = value?.description ?? '';
      twitterController.text = value?.twitter ?? '';
      facebookController.text = value?.facebook ?? '';
      githubController.text = value?.github ?? '';
      portfolioController.text = value?.portfolio ?? '';
      countryController.text = value?.country ?? '選択してください';
    });

    switch (myProfileProfile) {
      case AsyncError(:final error):
        Utils.showAlertError(context: context, error: error);
        return _mainView(context: context, ref: ref);
      case AsyncData():
        return _mainView(
          context: context,
          body: SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Utils.dismisKeyboard(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ユーザーネーム',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsConstant.text,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsConstant.gray,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsConstant.gray,
                          ),
                        ),
                        hintText: '田中太郎',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.gray2,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.text,
                      ),
                      onChanged: (value) {
                        myProfileProfile.value?.userName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '国',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsConstant.text,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            countryController.text = value.name;
                            myProfileProfile.value?.country = value.name;
                          },
                        );
                      },
                      child: IgnorePointer(
                        child: TextField(
                          controller: countryController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorsConstant.gray,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorsConstant.gray,
                              ),
                            ),
                            hintText: '選択してください',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.gray2,
                            ),
                            contentPadding: const EdgeInsets.all(12),
                            suffixIcon: Assets.images.pick.svg(),
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: 30, minHeight: 8),
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.text,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '自己紹介',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsConstant.text,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsConstant.gray,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsConstant.gray,
                          ),
                        ),
                        hintText: '自己紹介文を記入してください',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.gray2,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.text,
                      ),
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        myProfileProfile.value?.description = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'X（twitter）',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: twitterController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              hintText: 'https://twitter.com/userid',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.gray2,
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              myProfileProfile.value?.twitter = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Facebook',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: facebookController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              hintText: 'https://www.facebook.com/userid',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.gray2,
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              myProfileProfile.value?.facebook = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Github',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: githubController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              hintText: 'https://github.com/userid',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.gray2,
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              myProfileProfile.value?.github = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'ポートフォリオ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: portfolioController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.gray,
                                ),
                              ),
                              hintText: 'https://exsample.com',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.gray2,
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              myProfileProfile.value?.portfolio = value;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ref: ref,
        );
      default:
        return _mainView(
          context: context,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
          ref: ref,
        );
    }
  }

  Widget _mainView(
      {Widget? body, required BuildContext context, required WidgetRef ref}) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text(
              '変更を破棄しますか',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: const Text(
              'このまま戻ると変更が破棄されます',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              Column(
                children: [
                  CupertinoDialogAction(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('編集を続ける'),
                  ),
                  const Divider(
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                    child: const Text('破棄して戻る'),
                  )
                ],
              )
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'プロフィール編集',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorsConstant.text,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Utils.dismisKeyboard(context);
                await ref.read(editProfileProvider.notifier).editProfile();
                if (context.mounted) {
                  context.pop(true);
                }
              },
              child: const Text(
                '保存',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorsConstant.purple,
                ),
              ),
            )
          ],
        ),
        body: body,
      ),
    );
  }
}
