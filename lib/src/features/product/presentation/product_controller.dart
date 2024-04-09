import 'dart:io';

import 'package:app_buy_sell/src/features/home/app_list_provider.dart';
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
      app = app?.copyWith(appOwnerType: AppOwnerType.onwer);
    } else {
      final didPay = await _loadPay(appId);
      if (didPay) {
        app = app?.copyWith(appOwnerType: AppOwnerType.purchased);
      } else {
        app = app?.copyWith(appOwnerType: AppOwnerType.customer);
      }
    }
    return app;
  }

  Future<void> loadApp(String appId) async {
    state = const AsyncLoading();
    final snapshot = await _rootAppRef.doc(appId).get();
    var app = snapshot.data();
    app = app?.copyWith(
        appOwnerType: state.value?.appOwnerType ?? AppOwnerType.onwer);
    state = AsyncData(app);
  }

  Future<bool> _loadPay(String appId) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appId)
        .get();
    if (snapshot.data() != null) {
      return true;
    } else {
      return false;
    }
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
    state = AsyncData(
      appModel.copyWith(
        paySuccess: true,
        appOwnerType: AppOwnerType.purchased,
      ),
    );
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
    state = AsyncData(
      appModel.copyWith(
        paySuccess: true,
        appOwnerType: AppOwnerType.purchased,
      ),
    );
  }

  Future<void> deleteApp() async {
    state = const AsyncLoading();
    await _rootAppRef.doc(appId).delete();
    ref.read(appListProvider.notifier).getApps();
  }
}
