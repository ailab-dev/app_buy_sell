// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppstoreReviewModel _$AppstoreReviewModelFromJson(Map<String, dynamic> json) =>
    AppstoreReviewModel(
      json['feed'] == null
          ? null
          : AppstoreReviewFeed.fromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppstoreReviewModelToJson(
        AppstoreReviewModel instance) =>
    <String, dynamic>{
      'feed': instance.feed,
    };

AppstoreReviewFeed _$AppstoreReviewFeedFromJson(Map<String, dynamic> json) =>
    AppstoreReviewFeed()
      ..entry = (json['entry'] as List<dynamic>?)
          ?.map((e) => AppstoreReviewEntry.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AppstoreReviewFeedToJson(AppstoreReviewFeed instance) =>
    <String, dynamic>{
      'entry': instance.entry,
    };

AppstoreReviewEntry _$AppstoreReviewEntryFromJson(Map<String, dynamic> json) =>
    AppstoreReviewEntry()
      ..rating = json['im:rating'] == null
          ? null
          : AppstoreReviewLabel.fromJson(
              json['im:rating'] as Map<String, dynamic>)
      ..title = json['title'] == null
          ? null
          : AppstoreReviewLabel.fromJson(json['title'] as Map<String, dynamic>)
      ..content = json['content'] == null
          ? null
          : AppstoreReviewLabel.fromJson(
              json['content'] as Map<String, dynamic>)
      ..author = json['author'] == null
          ? null
          : AppstoreReviewAuthor.fromJson(
              json['author'] as Map<String, dynamic>)
      ..updated = json['updated'] == null
          ? null
          : AppstoreReviewLabel.fromJson(
              json['updated'] as Map<String, dynamic>);

Map<String, dynamic> _$AppstoreReviewEntryToJson(
        AppstoreReviewEntry instance) =>
    <String, dynamic>{
      'im:rating': instance.rating,
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'updated': instance.updated,
    };

AppstoreReviewAuthor _$AppstoreReviewAuthorFromJson(
        Map<String, dynamic> json) =>
    AppstoreReviewAuthor()
      ..name = json['name'] == null
          ? null
          : AppstoreReviewLabel.fromJson(json['name'] as Map<String, dynamic>);

Map<String, dynamic> _$AppstoreReviewAuthorToJson(
        AppstoreReviewAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AppstoreReviewLabel _$AppstoreReviewLabelFromJson(Map<String, dynamic> json) =>
    AppstoreReviewLabel()..label = json['label'] as String?;

Map<String, dynamic> _$AppstoreReviewLabelToJson(
        AppstoreReviewLabel instance) =>
    <String, dynamic>{
      'label': instance.label,
    };
