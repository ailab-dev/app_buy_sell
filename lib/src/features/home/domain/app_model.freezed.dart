// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppModel _$AppModelFromJson(Map<String, dynamic> json) {
  return _AppModel.fromJson(json);
}

/// @nodoc
mixin _$AppModel {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get iosId => throw _privateConstructorUsedError;
  String? get androidId => throw _privateConstructorUsedError;
  List<String> get banner => throw _privateConstructorUsedError;
  bool? get didPay => throw _privateConstructorUsedError;
  bool? get paySuccess => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppModelCopyWith<AppModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppModelCopyWith<$Res> {
  factory $AppModelCopyWith(AppModel value, $Res Function(AppModel) then) =
      _$AppModelCopyWithImpl<$Res, AppModel>;
  @useResult
  $Res call(
      {String name,
      String description,
      String iconUrl,
      String price,
      String id,
      String? iosId,
      String? androidId,
      List<String> banner,
      bool? didPay,
      bool? paySuccess,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$AppModelCopyWithImpl<$Res, $Val extends AppModel>
    implements $AppModelCopyWith<$Res> {
  _$AppModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? price = null,
    Object? id = null,
    Object? iosId = freezed,
    Object? androidId = freezed,
    Object? banner = null,
    Object? didPay = freezed,
    Object? paySuccess = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      iosId: freezed == iosId
          ? _value.iosId
          : iosId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidId: freezed == androidId
          ? _value.androidId
          : androidId // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      didPay: freezed == didPay
          ? _value.didPay
          : didPay // ignore: cast_nullable_to_non_nullable
              as bool?,
      paySuccess: freezed == paySuccess
          ? _value.paySuccess
          : paySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppModelImplCopyWith<$Res>
    implements $AppModelCopyWith<$Res> {
  factory _$$AppModelImplCopyWith(
          _$AppModelImpl value, $Res Function(_$AppModelImpl) then) =
      __$$AppModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String iconUrl,
      String price,
      String id,
      String? iosId,
      String? androidId,
      List<String> banner,
      bool? didPay,
      bool? paySuccess,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$$AppModelImplCopyWithImpl<$Res>
    extends _$AppModelCopyWithImpl<$Res, _$AppModelImpl>
    implements _$$AppModelImplCopyWith<$Res> {
  __$$AppModelImplCopyWithImpl(
      _$AppModelImpl _value, $Res Function(_$AppModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? price = null,
    Object? id = null,
    Object? iosId = freezed,
    Object? androidId = freezed,
    Object? banner = null,
    Object? didPay = freezed,
    Object? paySuccess = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$AppModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      iosId: freezed == iosId
          ? _value.iosId
          : iosId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidId: freezed == androidId
          ? _value.androidId
          : androidId // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      didPay: freezed == didPay
          ? _value.didPay
          : didPay // ignore: cast_nullable_to_non_nullable
              as bool?,
      paySuccess: freezed == paySuccess
          ? _value.paySuccess
          : paySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppModelImpl extends _AppModel {
  _$AppModelImpl(
      {required this.name,
      required this.description,
      required this.iconUrl,
      required this.price,
      required this.id,
      this.iosId,
      this.androidId,
      required final List<String> banner,
      this.didPay,
      this.paySuccess,
      @TimestampConverter() required this.createdAt})
      : _banner = banner,
        super._();

  factory _$AppModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppModelImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String iconUrl;
  @override
  final String price;
  @override
  final String id;
  @override
  final String? iosId;
  @override
  final String? androidId;
  final List<String> _banner;
  @override
  List<String> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  final bool? didPay;
  @override
  final bool? paySuccess;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'AppModel(name: $name, description: $description, iconUrl: $iconUrl, price: $price, id: $id, iosId: $iosId, androidId: $androidId, banner: $banner, didPay: $didPay, paySuccess: $paySuccess, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iosId, iosId) || other.iosId == iosId) &&
            (identical(other.androidId, androidId) ||
                other.androidId == androidId) &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.didPay, didPay) || other.didPay == didPay) &&
            (identical(other.paySuccess, paySuccess) ||
                other.paySuccess == paySuccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      iconUrl,
      price,
      id,
      iosId,
      androidId,
      const DeepCollectionEquality().hash(_banner),
      didPay,
      paySuccess,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppModelImplCopyWith<_$AppModelImpl> get copyWith =>
      __$$AppModelImplCopyWithImpl<_$AppModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppModelImplToJson(
      this,
    );
  }
}

abstract class _AppModel extends AppModel {
  factory _AppModel(
          {required final String name,
          required final String description,
          required final String iconUrl,
          required final String price,
          required final String id,
          final String? iosId,
          final String? androidId,
          required final List<String> banner,
          final bool? didPay,
          final bool? paySuccess,
          @TimestampConverter() required final DateTime createdAt}) =
      _$AppModelImpl;
  _AppModel._() : super._();

  factory _AppModel.fromJson(Map<String, dynamic> json) =
      _$AppModelImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get iconUrl;
  @override
  String get price;
  @override
  String get id;
  @override
  String? get iosId;
  @override
  String? get androidId;
  @override
  List<String> get banner;
  @override
  bool? get didPay;
  @override
  bool? get paySuccess;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AppModelImplCopyWith<_$AppModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
