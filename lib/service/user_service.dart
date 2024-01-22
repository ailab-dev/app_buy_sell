import 'package:app_buy_sell/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  CollectionReference<UserModel> get rootRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<UserModel?> getUser(String uid) async {
    var ref = await rootRef.doc(uid).get();
    return ref.data();
  }

  Future<void> createUserProfile(
    String userName,
  ) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var user = UserModel(
        uid,
        userName,
      );
      await rootRef.doc(uid).set(user);
    }
  }
}
