import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/user_profile/provider/report_state_provider.dart';
import 'package:app_buy_sell/src/features/user_profile/provider/report_user_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportUserView extends HookConsumerWidget {
  const ReportUserView({
    super.key,
    required this.userName,
    required this.userId,
  });
  final String userName;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportStateProvider);
    final reportController = useTextEditingController();

    return SingleChildScrollView(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Utils.dismisKeyboard(context);
        },
        child: Container(
          color: ColorsConstant.gray,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: ColorsConstant.gray,
                title: const Text(
                  'ユーザーを通報する',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsConstant.text,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'このユーザーにどのような問題がありますか？',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(ReportUserType.values.length, (index) {
                var item = ReportUserType.values[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Utils.dismisKeyboard(context);
                    ref.read(reportStateProvider.notifier).clickReport(item);
                  },
                  child: Row(
                    children: [
                      IgnorePointer(
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: reportState.contains(item),
                          fillColor: MaterialStatePropertyAll(
                              reportState.contains(item)
                                  ? ColorsConstant.purple
                                  : Colors.white),
                          onChanged: (value) {},
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                              width: 1.0,
                              color: ColorsConstant.gray2,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        item.text,
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsConstant.text,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: reportController,
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '通報の理由をお書きください（任意）',
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: ColorsConstant.gray2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorsConstant.text,
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextButton(
                        onPressed: () {
                          context.pop();
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
                        child: const Text(
                          'キャンセル',
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
                      child: TextButton(
                        onPressed: () async {
                          if (reportState.isEmpty &&
                              reportController.text.trim().isEmpty) {
                            return;
                          }
                          context.pop();
                          ref.read(reportUserProvider.notifier).reportUser(
                                userId,
                                reportState,
                                reportController.text.trim(),
                              );
                          final snackBar = SnackBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: ColorsConstant.text,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Assets.images.reportFinish.svg(),
                                    Text(
                                      '$userNameを通報しました',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              ColorsConstant.redStrong),
                        ),
                        child: const Text(
                          '通報する',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
