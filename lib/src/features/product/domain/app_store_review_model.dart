import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_store_review_model.g.dart';

@JsonSerializable()
class AppstoreReviewModel {
  AppstoreReviewFeed? feed;

  AppstoreReviewModel(this.feed);

  factory AppstoreReviewModel.fromJson(Map<String, dynamic> json) =>
      _$AppstoreReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppstoreReviewModelToJson(this);
}

@JsonSerializable()
class AppstoreReviewFeed {
  List<AppstoreReviewEntry>? entry;
  AppstoreReviewFeed();

  factory AppstoreReviewFeed.fromJson(Map<String, dynamic> json) =>
      _$AppstoreReviewFeedFromJson(json);

  Map<String, dynamic> toJson() => _$AppstoreReviewFeedToJson(this);
}

@JsonSerializable()
class AppstoreReviewEntry {
  @JsonKey(name: 'im:rating')
  AppstoreReviewLabel? rating;

  AppstoreReviewLabel? title;

  AppstoreReviewLabel? content;
  AppstoreReviewAuthor? author;

  AppstoreReviewLabel? updated;

  AppstoreReviewEntry();

  factory AppstoreReviewEntry.fromJson(Map<String, dynamic> json) =>
      _$AppstoreReviewEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AppstoreReviewEntryToJson(this);

  String get dateText {
    final label = updated?.label ?? '';
    if (label.isNotEmpty) {
      var df = DateFormat('yyyy/MM/dd');
      return df.format(DateTime.parse(label));
    }
    return '';
  }
}

@JsonSerializable()
class AppstoreReviewAuthor {
  AppstoreReviewLabel? name;

  AppstoreReviewAuthor();

  factory AppstoreReviewAuthor.fromJson(Map<String, dynamic> json) =>
      _$AppstoreReviewAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AppstoreReviewAuthorToJson(this);
}

@JsonSerializable()
class AppstoreReviewLabel {
  String? label;

  AppstoreReviewLabel();

  factory AppstoreReviewLabel.fromJson(Map<String, dynamic> json) =>
      _$AppstoreReviewLabelFromJson(json);

  Map<String, dynamic> toJson() => _$AppstoreReviewLabelToJson(this);
}
