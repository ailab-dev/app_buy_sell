import 'package:app_buy_sell/src/features/setting/domain/setting_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_controler.g.dart';

@riverpod
class SettingController extends _$SettingController {
  @override
  FutureOr<SettingModel> build() async {
    final enableNotification = await loadNotificationSetting();
    final setingModel = SettingModel(
        enableNotification: enableNotification, deleteAccount: false);
    return setingModel;
  }

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    await FirebaseAuth.instance.currentUser?.delete();
    await FirebaseAuth.instance.signOut();
    state = AsyncData(state.value!.copyWith(deleteAccount: true));
  }

  Future<bool> loadNotificationSetting() async {
    final data = await rootRef.doc('setting').get();
    return data.data()?.enableNotification ?? true;
  }

  CollectionReference<SettingModel> get rootRef {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('settings')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              SettingModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> clickNotificationSetting() async {
    final notificationEnable = state.value?.enableNotification ?? true;
    final setting =
        state.value!.copyWith(enableNotification: !notificationEnable);
    await rootRef.doc('setting').set(setting);
    state = AsyncData(
        state.value!.copyWith(enableNotification: !notificationEnable));
  }
}
