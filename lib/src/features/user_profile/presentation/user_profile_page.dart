import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/user_profile/presentation/my_profile_page.dart';
import 'package:app_buy_sell/src/features/user_profile/provider/user_profile_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userId == FirebaseAuth.instance.currentUser?.uid) {
      return const MyProfilePage();
    } else {
      final userProvider = ref.watch(UserProfileProvider(userId));
      userProvider.when(
        data: (data) {},
        error: (Object error, StackTrace stackTrace) {
          Utils.showAlertError(context: context, error: error);
        },
        loading: () {},
      );
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
                      Assets.images.report.svg(),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'ユーザーを通報する',
                        style: TextStyle(
                          color: ColorsConstant.redStrong,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
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
        body: LoadingView(
          isLoading: userProvider.isLoading,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    userProvider.value?.userName ?? '',
                    style: const TextStyle(
                      color: ColorsConstant.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '@${userProvider.value?.nickName ?? ''}',
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
                        '@${userProvider.value?.twitter ?? ''}',
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
                        '@${userProvider.value?.facebook ?? ''}',
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
                        '@${userProvider.value?.instagram ?? ''}',
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
                        '@${userProvider.value?.github ?? ''}',
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
        ),
      );
    }
  }
}
