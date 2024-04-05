import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/upload_app_controller.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppInfoPage extends HookConsumerWidget {
  const AppInfoPage({super.key, this.appModel});
  final AppModel? appModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadController = ref.watch(UploadAppControllerProvider(appModel));
    final nameController = useTextEditingController();
    nameController.text = uploadController.appName;
    final catchphraseController = useTextEditingController();
    catchphraseController.text = uploadController.appCatchphrase;
    final desciptionController = useTextEditingController();
    desciptionController.text = uploadController.description;

    final categoryController = useTextEditingController();

    categoryController.text =
        uploadController.categoryType?.typeName ?? '選択してください';

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'STEP1/3',
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
                        'アプリについて教えてください',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorsConstant.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'アプリの名前',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '${uploadController.nameLength}/30',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.gray2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'アプリ名を入力してください',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray2,
                          ),
                          fillColor: ColorsConstant.gray,
                          filled: true,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          ref
                              .read(uploadAppControllerProvider(appModel)
                                  .notifier)
                              .setAppName(value);
                        },
                        maxLength: 30,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.text,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'キャッチフレーズ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '${uploadController.catchphraseLength}/50',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.gray2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: catchphraseController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'アプリの特徴が伝わる簡潔なキャッチフレーズ',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray2,
                          ),
                          fillColor: ColorsConstant.gray,
                          filled: true,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          ref
                              .read(uploadAppControllerProvider(appModel)
                                  .notifier)
                              .setAppCatchphrase(value);
                        },
                        maxLength: 50,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.text,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'アプリの説明',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '${uploadController.descriptionLength}/250',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.gray2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: desciptionController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'アプリの簡単な説明を入力してください',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray2,
                          ),
                          fillColor: ColorsConstant.gray,
                          filled: true,
                          counterText: '',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          ref
                              .read(uploadAppControllerProvider(appModel)
                                  .notifier)
                              .setAppDescription(value);
                        },
                        maxLength: 250,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.text,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'カテゴリー',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Utils.dismissKeyboard(context);
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoActionSheet(
                              actions: CategoryType.values
                                  .map(
                                    (e) => CupertinoActionSheetAction(
                                      onPressed: () {
                                        context.pop();
                                        ref
                                            .read(uploadAppControllerProvider(
                                                    appModel)
                                                .notifier)
                                            .setAppCategory(e);
                                      },
                                      child: Text(e.typeName),
                                    ),
                                  )
                                  .toList(),
                              cancelButton: TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text(
                                  'キャンセル',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: IgnorePointer(
                          child: TextField(
                            controller: categoryController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.gray2,
                              ),
                              fillColor: ColorsConstant.gray,
                              filled: true,
                              suffixIcon: Assets.images.pick.svg(),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 30,
                                minHeight: 8,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 120,
                  height: 47,
                  child: TextButton(
                    onPressed: uploadController.appInfoValidate
                        ? () {
                            Utils.dismissKeyboard(context);
                            ref
                                .read(uploadAppControllerProvider(appModel)
                                    .notifier)
                                .nextPage();
                          }
                        : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        uploadController.appInfoValidate
                            ? ColorsConstant.text
                            : ColorsConstant.gray2,
                      ),
                    ),
                    child: const Text(
                      '次へ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
