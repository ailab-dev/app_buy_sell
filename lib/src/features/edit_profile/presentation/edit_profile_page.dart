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
      if (userNameController.text != value?.userName) {
        userNameController.text = value?.userName ?? '';
      }
      if (descriptionController.text != value?.description) {
        descriptionController.text = value?.description ?? '';
      }
      if (twitterController.text != value?.twitter) {
        twitterController.text = value?.twitter ?? '';
      }
      if (facebookController.text != value?.facebook) {
        facebookController.text = value?.facebook ?? '';
      }
      if (githubController.text != value?.github) {
        githubController.text = value?.github ?? '';
      }
      if (portfolioController.text != value?.portfolio) {
        portfolioController.text = value?.portfolio ?? '';
      }
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
                Utils.dismissKeyboard(context);
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
                        ref
                            .read(editProfileProvider.notifier)
                            .setUserName(value);
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
                            ref
                                .read(editProfileProvider.notifier)
                                .setCountry(value.name);
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
                        ref
                            .read(editProfileProvider.notifier)
                            .setDescription(value);
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
                            decoration: _inputDecoration(
                              hintText: 'https://twitter.com/userid',
                              errorText:
                                  (myProfileProfile.value?.xValid ?? true)
                                      ? null
                                      : 'X（twitter）無効',
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              ref
                                  .read(editProfileProvider.notifier)
                                  .setTwitter(value);
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
                            decoration: _inputDecoration(
                              hintText: 'https://www.facebook.com/userid',
                              errorText:
                                  (myProfileProfile.value?.facebookValid ??
                                          true)
                                      ? null
                                      : 'Facebook無効',
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              ref
                                  .read(editProfileProvider.notifier)
                                  .setFacebook(value);
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
                            decoration: _inputDecoration(
                              hintText: 'https://github.com/userid',
                              errorText:
                                  (myProfileProfile.value?.githubValid ?? true)
                                      ? null
                                      : 'Github無効',
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              ref
                                  .read(editProfileProvider.notifier)
                                  .setGithub(value);
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
                            decoration: _inputDecoration(
                                hintText: 'https://exsample.com',
                                errorText:
                                    (myProfileProfile.value?.portfolioValid ??
                                            true)
                                        ? null
                                        : 'ポートフォリオ無効'),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                            onChanged: (value) {
                              ref
                                  .read(editProfileProvider.notifier)
                                  .setPortfolio(value);
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
              SizedBox(
                width: double.maxFinite,
                child: CupertinoDialogAction(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('編集を続ける'),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                  child: const Text('破棄して戻る'),
                ),
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
              onPressed: ref.read(editProfileProvider.notifier).canSave
                  ? () async {
                      Utils.dismissKeyboard(context);
                      await ref
                          .read(editProfileProvider.notifier)
                          .editProfile();
                      if (context.mounted) {
                        context.pop(true);
                      }
                    }
                  : null,
              child: Text(
                '保存',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ref.read(editProfileProvider.notifier).canSave
                      ? ColorsConstant.purple
                      : ColorsConstant.gray2,
                ),
              ),
            )
          ],
        ),
        body: body,
      ),
    );
  }

  InputDecoration _inputDecoration({String? hintText, String? errorText}) {
    return InputDecoration(
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
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsConstant.gray,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsConstant.gray,
        ),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorsConstant.gray2,
      ),
      contentPadding: const EdgeInsets.all(12),
      errorText: errorText,
    );
  }
}
