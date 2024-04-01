import 'dart:io';

import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/data/pay_repository.dart';
import 'package:app_buy_sell/src/features/product/data/pay_service.dart';
import 'package:app_buy_sell/src/features/product/domain/apple_payment_model.dart';
import 'package:app_buy_sell/src/features/product/domain/google_payment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pay/pay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<AppModel?> build(String appId) async {
    final snapshot = await _rootAppRef.doc(appId).get();
    var app = snapshot.data();
    if (app?.ownerId == FirebaseAuth.instance.currentUser?.uid) {
      app = app?.copyWith(didPay: true);
    }
    return app;
  }

  CollectionReference<AppModel> get _rootAppRef {
    return FirebaseFirestore.instance.collection('apps').withConverter(
          fromFirestore: (snapshot, _) => AppModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> pay() async {
    final appModel = state.value;
    if (appModel != null) {
      final paymentItems = [
        PaymentItem(
          label: '購入するアプリ',
          amount: appModel.price,
          status: PaymentItemStatus.final_price,
        )
      ];
      if (Platform.isIOS) {
        final result = await PayService(ApplePayImpl()).pay(paymentItems);
        final applePayment = ApplePaymentModel.fromJson(result);
        await saveApplePayment(applePayment, appModel);
      } else {
        final result = await PayService(GoolePayImpl()).pay(paymentItems);
        final goolePayment = GooglePaymentModel.fromJson(result);
        await saveGooglePayment(goolePayment, appModel);
      }
      await _updateAppOwner();
    }
  }

  Future<void> _updateAppOwner() async {
    final appId = state.value?.id;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (appId != null) {
      await _rootAppRef.doc(appId).update({'ownerId': uid});
    }
  }

  Future<void> saveGooglePayment(
      GooglePaymentModel payment, AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appModel.id)
        .set(payment.toJson());
    state = AsyncData(appModel.copyWith(paySuccess: true, didPay: true));
  }

  Future<void> saveApplePayment(
      ApplePaymentModel payment, AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appModel.id)
        .set(payment.toJson());
    state = AsyncData(appModel.copyWith(paySuccess: true, didPay: true));
  }
}
