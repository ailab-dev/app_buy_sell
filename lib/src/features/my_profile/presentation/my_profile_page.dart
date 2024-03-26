import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/my_profile/provider/my_profile_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(myProfileProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          MenuAnchor(
            alignmentOffset: const Offset(-115, 0),
            style: const MenuStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            menuChildren: [
              MenuItemButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Row(
                  children: [
                    Assets.images.editSquare.svg(),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'プロフィール編集',
                      style: TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                onPressed: () async {
                  final result = await context.push('/edit-profile');
                  if (result is bool && result) {
                    ref.read(myProfileProvider.notifier).loadInfo();
                  }
                },
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                height: 0,
                thickness: 0.5,
              ),
              MenuItemButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Row(
                  children: [
                    Assets.images.settings.svg(),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      '設定',
                      style: TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  context.push('/setting');
                },
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                height: 0,
                thickness: 0.5,
              ),
              MenuItemButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Row(
                  children: [
                    Assets.images.logout.svg(),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'ログアウト',
                      style: TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
              )
            ],
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(
                  Icons.more_horiz,
                ),
              );
            },
          )
        ],
      ),
      body: userProvider.when(
        data: (data) {
          return LoadingView(
            isLoading: userProvider.isLoading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userProvider.value?.userName ?? '',
                          style: const TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final result = await context.push('/edit-profile');
                            if (result is bool && result) {
                              ref.read(myProfileProvider.notifier).loadInfo();
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: const BorderSide(
                                  color: ColorsConstant.text,
                                ),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.images.editSquare.svg(),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                '編集',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConstant.text,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _checkEmpty(userProvider.value?.nickName)
                          ? ''
                          : '@${userProvider.value?.nickName ?? ''}',
                      style: const TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    color: ColorsConstant.gray,
                    endIndent: 0,
                    indent: 0,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      userProvider.value?.description ?? '',
                      style: const TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'SNS・リンク',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorsConstant.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Assets.images.x.svg(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          _checkEmpty(userProvider.value?.twitter)
                              ? ''
                              : '@${userProvider.value?.twitter ?? ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray3,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Assets.images.facebook.svg(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          _checkEmpty(userProvider.value?.facebook)
                              ? ''
                              : '@${userProvider.value?.facebook ?? ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray3,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Assets.images.instagram.image(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          _checkEmpty(userProvider.value?.instagram)
                              ? ''
                              : '@${userProvider.value?.instagram ?? ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray3,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Assets.images.github.svg(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          _checkEmpty(userProvider.value?.github)
                              ? ''
                              : '@${userProvider.value?.github ?? ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray3,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Assets.images.portfolio.svg(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          userProvider.value?.portfolio ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.gray3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          Utils.showAlertError(context: context, error: error);
          return null;
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  bool _checkEmpty(String? text) {
    if (text != null && text.trim().isNotEmpty) {
      return false;
    }
    return true;
  }
}
