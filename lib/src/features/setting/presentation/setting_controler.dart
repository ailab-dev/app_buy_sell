import 'package:app_buy_sell/src/features/register_profile/domain/user_model.dart';
import 'package:app_buy_sell/src/features/setting/domain/setting_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_controler.g.dart';

@riverpod
class SettingController extends _$SettingController {
  @override
  FutureOr<UserModel?> build() async {
    return await loadUserInfo();
  }

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    await FirebaseAuth.instance.currentUser?.delete();
    await FirebaseAuth.instance.signOut();
    final setting = state.value!.setting?.copyWith(deleteAccount: true) ??
        SettingModel(deleteAccount: true);
    state = AsyncData(
      state.value!.copyWith(
        setting: setting,
      ),
    );
  }

  CollectionReference<UserModel> get rootRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<UserModel?> loadUserInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final data = await rootRef.doc(uid).get();
    return data.data();
  }

  Future<void> clickNotificationSetting() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final enable = state.value?.setting?.enableNotification ?? true;
    final setting =
        state.value!.setting?.copyWith(enableNotification: !enable) ??
            SettingModel(enableNotification: !enable);
    await rootRef.doc(uid).update({'setting': setting.toJson()});
    state = AsyncData(state.value!.copyWith(setting: setting));
  }
}
