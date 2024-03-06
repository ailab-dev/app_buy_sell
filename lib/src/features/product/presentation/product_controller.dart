import 'dart:io';

import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pay/pay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<AppModel> build(AppModel appModel) async {
    final didPay = await _loadPay(appModel);
    final app = appModel.copyWith(didPay: didPay);
    return app;
  }

  Future<bool> _loadPay(AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appModel.id)
        .get();
    if (snapshot.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> pay(AppModel appModel) async {
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
      await savePayment(result, appModel);
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
      await savePayment(result, appModel);
    }
  }

  Future<void> savePayment(
      Map<String, dynamic> payment, AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    payment['createdAt'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appModel.id)
        .set(payment);
    state = AsyncData(appModel.copyWith(paySuccess: true, didPay: true));
  }
}
