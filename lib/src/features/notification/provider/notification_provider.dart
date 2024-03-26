import 'package:app_buy_sell/src/constants/constant.dart';
import 'package:app_buy_sell/src/features/notification/domain/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

@riverpod
class NotificationList extends _$NotificationList {
  @override
  FutureOr<List<NotificationModel>> build() async {
    final response = await getNotifications();
    final data = response.$1;
    return data;
  }

  CollectionReference<NotificationModel> get _rootRef {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notification')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              NotificationModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<(List<NotificationModel>, DocumentSnapshot<NotificationModel>?)>
      getNotifications({
    DocumentSnapshot<NotificationModel>? latestDoc,
    int limit = Constant.limit,
  }) async {
    DocumentSnapshot<NotificationModel>? lateDocument;

    Query<NotificationModel> query = _rootRef.limit(limit);
    query = query.orderBy('createdAt', descending: true);

    if (latestDoc != null) {
      query = query.startAfterDocument(latestDoc);
    }

    var snapshot = await query.get();
    lateDocument = snapshot.docs.lastOrNull;
    var list = snapshot.docs.map((e) => e.data()).toList();
    return (list, lateDocument);
  }
}
