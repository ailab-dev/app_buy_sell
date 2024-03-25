import 'package:app_buy_sell/src/features/register_profile/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_provider.g.dart';

@riverpod
class EditProfile extends _$EditProfile {
  @override
  FutureOr<UserModel?> build() async {
    return await getMyInfo();
  }

  Future<UserModel?> getMyInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final ref = await rootRef.doc(uid).get();
    return ref.data();
  }

  CollectionReference<UserModel> get rootRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> editProfile() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    var userData = state.value;
    if (uid != null && userData != null) {
      await rootRef.doc(uid).set(userData);
    }
  }

  void setUserName(String value) {
    state = AsyncValue.data(state.value?.copyWith(userName: value));
  }

  void setCountry(String value) {
    state = AsyncValue.data(state.value?.copyWith(country: value));
  }

  void setDescription(String value) {
    state = AsyncValue.data(state.value?.copyWith(description: value));
  }

  void setTwitter(String value) {
    state = AsyncValue.data(state.value?.copyWith(twitter: value));
  }

  void setFacebook(String value) {
    state = AsyncValue.data(state.value?.copyWith(facebook: value));
  }

  void setGithub(String value) {
    state = AsyncValue.data(state.value?.copyWith(github: value));
  }

  void setPortfolio(String value) {
    state = AsyncValue.data(state.value?.copyWith(portfolio: value));
  }
}
