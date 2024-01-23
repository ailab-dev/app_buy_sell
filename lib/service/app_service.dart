import 'package:app_buy_sell/model/app_model.dart';
import 'package:app_buy_sell/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppService {
  CollectionReference<AppModel> get _rootRef {
    return FirebaseFirestore.instance.collection('apps').withConverter(
          fromFirestore: (snapshot, _) => AppModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<(List<AppModel>, DocumentSnapshot<AppModel>?)> getApps({
    DocumentSnapshot<AppModel>? latestDoc,
    int limit = Constant.limit,
    bool includeDelete = false,
  }) async {
    DocumentSnapshot<AppModel>? lateDocument;

    Query<AppModel> query = _rootRef.limit(limit);

    if (!includeDelete) {
      query = query.where('delete', isEqualTo: false);
    }
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
