// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  bool get enableNotification => throw _privateConstructorUsedError;
  @Freezed(toJson: false, fromJson: false)
  bool get deleteAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {bool enableNotification,
      @Freezed(toJson: false, fromJson: false) bool deleteAccount});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableNotification = null,
    Object? deleteAccount = null,
  }) {
    return _then(_value.copyWith(
      enableNotification: null == enableNotification
          ? _value.enableNotification
          : enableNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteAccount: null == deleteAccount
          ? _value.deleteAccount
          : deleteAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelImplCopyWith(
          _$SettingModelImpl value, $Res Function(_$SettingModelImpl) then) =
      __$$SettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enableNotification,
      @Freezed(toJson: false, fromJson: false) bool deleteAccount});
}

/// @nodoc
class __$$SettingModelImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelImpl>
    implements _$$SettingModelImplCopyWith<$Res> {
  __$$SettingModelImplCopyWithImpl(
      _$SettingModelImpl _value, $Res Function(_$SettingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableNotification = null,
    Object? deleteAccount = null,
  }) {
    return _then(_$SettingModelImpl(
      enableNotification: null == enableNotification
          ? _value.enableNotification
          : enableNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteAccount: null == deleteAccount
          ? _value.deleteAccount
          : deleteAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingModelImpl implements _SettingModel {
  _$SettingModelImpl(
      {this.enableNotification = true,
      @Freezed(toJson: false, fromJson: false) this.deleteAccount = false});

  factory _$SettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingModelImplFromJson(json);

  @override
  @JsonKey()
  final bool enableNotification;
  @override
  @JsonKey()
  @Freezed(toJson: false, fromJson: false)
  final bool deleteAccount;

  @override
  String toString() {
    return 'SettingModel(enableNotification: $enableNotification, deleteAccount: $deleteAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelImpl &&
            (identical(other.enableNotification, enableNotification) ||
                other.enableNotification == enableNotification) &&
            (identical(other.deleteAccount, deleteAccount) ||
                other.deleteAccount == deleteAccount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enableNotification, deleteAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      __$$SettingModelImplCopyWithImpl<_$SettingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingModelImplToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  factory _SettingModel(
          {final bool enableNotification,
          @Freezed(toJson: false, fromJson: false) final bool deleteAccount}) =
      _$SettingModelImpl;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$SettingModelImpl.fromJson;

  @override
  bool get enableNotification;
  @override
  @Freezed(toJson: false, fromJson: false)
  bool get deleteAccount;
  @override
  @JsonKey(ignore: true)
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
