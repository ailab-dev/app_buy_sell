import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/notification/provider/notification_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationList = ref.watch(notificationListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications_outlined,
            ),
            SizedBox(
              width: 5,
            ),
            Text('通知')
          ],
        ),
      ),
      body: notificationList.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text(
                '通知はありません',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsConstant.gray3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final notification = data[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(
                              color: ColorsConstant.purple,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            notification.content,
                            style: const TextStyle(
                              color: ColorsConstant.text,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            notification.createText,
                            style: const TextStyle(
                              color: ColorsConstant.gray2,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: notification.iconUrl ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ]),
                );
              },
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Color.fromRGBO(237, 243, 245, 1),
                );
              },
            );
          }
        },
        error: (error, stackTrace) {
          Utils.showAlertError(error: error, context: context);
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
}
