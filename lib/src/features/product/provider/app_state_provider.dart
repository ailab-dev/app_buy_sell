import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppState extends _$AppState {
  @override
  FutureOr<bool> build(AppModel appModel) async {
    return await _loadPay(appModel);
  }

  Future<bool> _loadPay(AppModel appModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return false;
    }
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
}
