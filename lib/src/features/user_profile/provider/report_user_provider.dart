import 'package:app_buy_sell/src/features/user_profile/domain/report_model.dart';
import 'package:app_buy_sell/src/features/user_profile/provider/report_state_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_user_provider.g.dart';

@riverpod
class ReportUser extends _$ReportUser {
  @override
  FutureOr<bool> build() {
    return false;
  }

  CollectionReference<ReportModel> get rootRef {
    return FirebaseFirestore.instance.collection('reports').withConverter(
          fromFirestore: (snapshot, _) =>
              ReportModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> reportUser(String targetUserId, List<ReportUserType> reportList,
      String content) async {
    final reportModel = ReportModel(
      FirebaseAuth.instance.currentUser?.uid ?? '',
      targetUserId,
      reportList.map((e) => e.param).toList(),
      content,
    );
    await rootRef.add(reportModel);
    state = const AsyncValue.data(true);
  }
}
