import 'package:app_buy_sell/src/constants/constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_list_provider.g.dart';

@riverpod
class AppList extends _$AppList {
  @override
  FutureOr<List<AppModel>> build() async {
    final response = await _requestApps();
    final data = response.$1;
    return data;
  }

  Future<void> getApps() async {
    final response = await _requestApps();
    final data = response.$1;
    state = AsyncValue.data(data);
  }

  CollectionReference<AppModel> get _rootRef {
    return FirebaseFirestore.instance.collection('apps').withConverter(
          fromFirestore: (snapshot, _) => AppModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<(List<AppModel>, DocumentSnapshot<AppModel>?)> _requestApps({
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
