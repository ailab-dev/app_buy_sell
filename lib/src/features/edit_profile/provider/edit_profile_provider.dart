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
    var user = state.value;
    if (uid != null && user != null) {
      await rootRef.doc(uid).set(user);
    }
  }
}
