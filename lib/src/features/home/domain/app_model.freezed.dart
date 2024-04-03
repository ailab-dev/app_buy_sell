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
  String? get appStoreUrl => throw _privateConstructorUsedError;
  String? get gPlayUrl => throw _privateConstructorUsedError;
  List<String> get banner => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? get paySuccess => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get catchphrase => throw _privateConstructorUsedError;
  CategoryType? get categoryType => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AppOwnerType get appOwnerType => throw _privateConstructorUsedError;

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
      String? appStoreUrl,
      String? gPlayUrl,
      List<String> banner,
      @JsonKey(includeFromJson: false, includeToJson: false) bool? paySuccess,
      @TimestampConverter() DateTime createdAt,
      String ownerId,
      String catchphrase,
      CategoryType? categoryType,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AppOwnerType appOwnerType});
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
    Object? appStoreUrl = freezed,
    Object? gPlayUrl = freezed,
    Object? banner = null,
    Object? paySuccess = freezed,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? catchphrase = null,
    Object? categoryType = freezed,
    Object? appOwnerType = null,
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
      appStoreUrl: freezed == appStoreUrl
          ? _value.appStoreUrl
          : appStoreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gPlayUrl: freezed == gPlayUrl
          ? _value.gPlayUrl
          : gPlayUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paySuccess: freezed == paySuccess
          ? _value.paySuccess
          : paySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      catchphrase: null == catchphrase
          ? _value.catchphrase
          : catchphrase // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      appOwnerType: null == appOwnerType
          ? _value.appOwnerType
          : appOwnerType // ignore: cast_nullable_to_non_nullable
              as AppOwnerType,
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
      String? appStoreUrl,
      String? gPlayUrl,
      List<String> banner,
      @JsonKey(includeFromJson: false, includeToJson: false) bool? paySuccess,
      @TimestampConverter() DateTime createdAt,
      String ownerId,
      String catchphrase,
      CategoryType? categoryType,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AppOwnerType appOwnerType});
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
    Object? appStoreUrl = freezed,
    Object? gPlayUrl = freezed,
    Object? banner = null,
    Object? paySuccess = freezed,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? catchphrase = null,
    Object? categoryType = freezed,
    Object? appOwnerType = null,
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
      appStoreUrl: freezed == appStoreUrl
          ? _value.appStoreUrl
          : appStoreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gPlayUrl: freezed == gPlayUrl
          ? _value.gPlayUrl
          : gPlayUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paySuccess: freezed == paySuccess
          ? _value.paySuccess
          : paySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      catchphrase: null == catchphrase
          ? _value.catchphrase
          : catchphrase // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      appOwnerType: null == appOwnerType
          ? _value.appOwnerType
          : appOwnerType // ignore: cast_nullable_to_non_nullable
              as AppOwnerType,
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
      this.appStoreUrl,
      this.gPlayUrl,
      required final List<String> banner,
      @JsonKey(includeFromJson: false, includeToJson: false) this.paySuccess,
      @TimestampConverter() required this.createdAt,
      this.ownerId = '',
      this.catchphrase = '',
      this.categoryType,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.appOwnerType = AppOwnerType.customer})
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
  final String? appStoreUrl;
  @override
  final String? gPlayUrl;
  final List<String> _banner;
  @override
  List<String> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool? paySuccess;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey()
  final String ownerId;
  @override
  @JsonKey()
  final String catchphrase;
  @override
  final CategoryType? categoryType;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AppOwnerType appOwnerType;

  @override
  String toString() {
    return 'AppModel(name: $name, description: $description, iconUrl: $iconUrl, price: $price, id: $id, appStoreUrl: $appStoreUrl, gPlayUrl: $gPlayUrl, banner: $banner, paySuccess: $paySuccess, createdAt: $createdAt, ownerId: $ownerId, catchphrase: $catchphrase, categoryType: $categoryType, appOwnerType: $appOwnerType)';
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
            (identical(other.appStoreUrl, appStoreUrl) ||
                other.appStoreUrl == appStoreUrl) &&
            (identical(other.gPlayUrl, gPlayUrl) ||
                other.gPlayUrl == gPlayUrl) &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.paySuccess, paySuccess) ||
                other.paySuccess == paySuccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.catchphrase, catchphrase) ||
                other.catchphrase == catchphrase) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.appOwnerType, appOwnerType) ||
                other.appOwnerType == appOwnerType));
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
      appStoreUrl,
      gPlayUrl,
      const DeepCollectionEquality().hash(_banner),
      paySuccess,
      createdAt,
      ownerId,
      catchphrase,
      categoryType,
      appOwnerType);

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
      final String? appStoreUrl,
      final String? gPlayUrl,
      required final List<String> banner,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool? paySuccess,
      @TimestampConverter() required final DateTime createdAt,
      final String ownerId,
      final String catchphrase,
      final CategoryType? categoryType,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AppOwnerType appOwnerType}) = _$AppModelImpl;
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
  String? get appStoreUrl;
  @override
  String? get gPlayUrl;
  @override
  List<String> get banner;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? get paySuccess;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get ownerId;
  @override
  String get catchphrase;
  @override
  CategoryType? get categoryType;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AppOwnerType get appOwnerType;
  @override
  @JsonKey(ignore: true)
  _$$AppModelImplCopyWith<_$AppModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
