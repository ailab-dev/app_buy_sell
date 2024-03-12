import 'package:app_buy_sell/src/features/user_profile/domain/report_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_state_provider.g.dart';

@riverpod
class ReportState extends _$ReportState {
  @override
  List<ReportUserType> build() {
    return [];
  }

  void clickReport(ReportUserType reportUserType) {
    if (!state.contains(reportUserType)) {
      state = [...state, reportUserType];
    } else {
      state = [
        for (final type in state)
          if (type != reportUserType) type,
      ];
    }
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
        user: FirebaseAuth.instance.currentUser?.uid ?? '',
        targetUser: targetUserId,
        reportType: reportList.map((e) => e.param).toList(),
        content: content,
        createdAt: DateTime.now());
    await rootRef.add(reportModel);
  }
}

enum ReportUserType {
  violateTerms,
  violateCopyright,
  badExpression,
  spam,
  other
}

extension ReportUserTypeEx on ReportUserType {
  String get param {
    switch (this) {
      case ReportUserType.violateTerms:
        return 'violate-terms';
      case ReportUserType.violateCopyright:
        return 'violate-copyright';
      case ReportUserType.badExpression:
        return 'bad-expression';
      case ReportUserType.spam:
        return 'spam';
      case ReportUserType.other:
        return 'other';
    }
  }

  String get text {
    switch (this) {
      case ReportUserType.violateTerms:
        return '利用規約に違反している';
      case ReportUserType.violateCopyright:
        return '著作権を侵害している';
      case ReportUserType.badExpression:
        return '不適切な表現をしている';
      case ReportUserType.spam:
        return 'スパムの疑いがある';
      case ReportUserType.other:
        return 'その他';
    }
  }
}
