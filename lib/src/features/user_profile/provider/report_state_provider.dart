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
