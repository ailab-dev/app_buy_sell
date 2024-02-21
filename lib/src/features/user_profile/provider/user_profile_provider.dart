import 'package:app_buy_sell/src/features/register_profile/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_provider.g.dart';

@riverpod
class UserProfile extends _$UserProfile {
  @override
  FutureOr<UserModel?> build(String uid) async {
    return await getUserInfo(uid);
  }

  Future<UserModel?> getUserInfo(String uid) async {
    final ref = await rootRef.doc(uid).get();
    return ref.data();
  }

  CollectionReference<UserModel> get rootRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }
}
