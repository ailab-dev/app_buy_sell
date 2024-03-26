// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get twitter => throw _privateConstructorUsedError;
  String get facebook => throw _privateConstructorUsedError;
  String get github => throw _privateConstructorUsedError;
  String get portfolio => throw _privateConstructorUsedError;
  String get instagram => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String description,
      String nickName,
      String twitter,
      String facebook,
      String github,
      String portfolio,
      String instagram,
      String? country});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? description = null,
    Object? nickName = null,
    Object? twitter = null,
    Object? facebook = null,
    Object? github = null,
    Object? portfolio = null,
    Object? instagram = null,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: null == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      facebook: null == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      portfolio: null == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String description,
      String nickName,
      String twitter,
      String facebook,
      String github,
      String portfolio,
      String instagram,
      String? country});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? description = null,
    Object? nickName = null,
    Object? twitter = null,
    Object? facebook = null,
    Object? github = null,
    Object? portfolio = null,
    Object? instagram = null,
    Object? country = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: null == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      facebook: null == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      portfolio: null == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  _$UserModelImpl(
      {required this.id,
      required this.userName,
      this.description = '',
      this.nickName = '',
      this.twitter = '',
      this.facebook = '',
      this.github = '',
      this.portfolio = '',
      this.instagram = '',
      this.country})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String nickName;
  @override
  @JsonKey()
  final String twitter;
  @override
  @JsonKey()
  final String facebook;
  @override
  @JsonKey()
  final String github;
  @override
  @JsonKey()
  final String portfolio;
  @override
  @JsonKey()
  final String instagram;
  @override
  final String? country;

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, description: $description, nickName: $nickName, twitter: $twitter, facebook: $facebook, github: $github, portfolio: $portfolio, instagram: $instagram, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.portfolio, portfolio) ||
                other.portfolio == portfolio) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, description,
      nickName, twitter, facebook, github, portfolio, instagram, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      {required final String id,
      required final String userName,
      final String description,
      final String nickName,
      final String twitter,
      final String facebook,
      final String github,
      final String portfolio,
      final String instagram,
      final String? country}) = _$UserModelImpl;
  _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get description;
  @override
  String get nickName;
  @override
  String get twitter;
  @override
  String get facebook;
  @override
  String get github;
  @override
  String get portfolio;
  @override
  String get instagram;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
