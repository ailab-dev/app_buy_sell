import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/provider/app_state_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_payment_provider.g.dart';

@riverpod
class SavePayment extends _$SavePayment {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> savePayment(
      Map<String, dynamic> payment, AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      state = const AsyncData(false);
    }
    payment['createdAt'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('app')
        .doc(appModel.id)
        .set(payment);
    state = const AsyncData(true);
    ref.read(appStateProvider(appModel).notifier).state = const AsyncData(true);
  }
}
