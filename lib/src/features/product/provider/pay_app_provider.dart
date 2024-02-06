import 'dart:io';

import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/provider/save_payment_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pay/pay.dart';

part 'pay_app_provider.g.dart';

@riverpod
class PayApp extends _$PayApp {
  @override
  FutureOr<bool> build() async {
    ref.listen(savePaymentProvider, (previous, next) {
      next.when(
        data: (data) {
          state = AsyncData(data);
        },
        error: (error, stackTrace) {
          state = AsyncValue.error(error, stackTrace);
        },
        loading: () {
          state = const AsyncValue.loading();
        },
      );
    });
    return false;
  }

  Future<void> pay(AppModel appModel) async {
    state = const AsyncValue.loading();
    try {
      final paymentItems = [
        PaymentItem(
          label: '購入するアプリ',
          amount: appModel.price.toString(),
          status: PaymentItemStatus.final_price,
        )
      ];
      if (Platform.isIOS) {
        final applePayConfigFuture =
            await PaymentConfiguration.fromAsset('apple_pay_config.json');
        final Pay payClient = Pay({
          PayProvider.apple_pay: applePayConfigFuture,
        });
        final result = await payClient.showPaymentSelector(
          PayProvider.apple_pay,
          paymentItems,
        );
        ref.read(savePaymentProvider.notifier).savePayment(result, appModel);
      } else {
        final googlePayConfigFuture =
            await PaymentConfiguration.fromAsset('google_pay_config.json');
        final Pay payClient = Pay({
          PayProvider.google_pay: googlePayConfigFuture,
        });
        final result = await payClient.showPaymentSelector(
          PayProvider.google_pay,
          paymentItems,
        );
        ref.read(savePaymentProvider.notifier).savePayment(result, appModel);
      }
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
