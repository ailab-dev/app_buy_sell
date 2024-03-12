// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplePaymentModel _$ApplePaymentModelFromJson(Map<String, dynamic> json) {
  return _ApplePaymentModel.fromJson(json);
}

/// @nodoc
mixin _$ApplePaymentModel {
  String? get token => throw _privateConstructorUsedError;
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  String? get transactionIdentifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplePaymentModelCopyWith<ApplePaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplePaymentModelCopyWith<$Res> {
  factory $ApplePaymentModelCopyWith(
          ApplePaymentModel value, $Res Function(ApplePaymentModel) then) =
      _$ApplePaymentModelCopyWithImpl<$Res, ApplePaymentModel>;
  @useResult
  $Res call(
      {String? token,
      PaymentMethod? paymentMethod,
      String? transactionIdentifier});

  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$ApplePaymentModelCopyWithImpl<$Res, $Val extends ApplePaymentModel>
    implements $ApplePaymentModelCopyWith<$Res> {
  _$ApplePaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? paymentMethod = freezed,
    Object? transactionIdentifier = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      transactionIdentifier: freezed == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplePaymentModelImplCopyWith<$Res>
    implements $ApplePaymentModelCopyWith<$Res> {
  factory _$$ApplePaymentModelImplCopyWith(_$ApplePaymentModelImpl value,
          $Res Function(_$ApplePaymentModelImpl) then) =
      __$$ApplePaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token,
      PaymentMethod? paymentMethod,
      String? transactionIdentifier});

  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$ApplePaymentModelImplCopyWithImpl<$Res>
    extends _$ApplePaymentModelCopyWithImpl<$Res, _$ApplePaymentModelImpl>
    implements _$$ApplePaymentModelImplCopyWith<$Res> {
  __$$ApplePaymentModelImplCopyWithImpl(_$ApplePaymentModelImpl _value,
      $Res Function(_$ApplePaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? paymentMethod = freezed,
    Object? transactionIdentifier = freezed,
  }) {
    return _then(_$ApplePaymentModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      transactionIdentifier: freezed == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ApplePaymentModelImpl extends _ApplePaymentModel {
  _$ApplePaymentModelImpl(
      {this.token, this.paymentMethod, this.transactionIdentifier})
      : super._();

  factory _$ApplePaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplePaymentModelImplFromJson(json);

  @override
  final String? token;
  @override
  final PaymentMethod? paymentMethod;
  @override
  final String? transactionIdentifier;

  @override
  String toString() {
    return 'ApplePaymentModel(token: $token, paymentMethod: $paymentMethod, transactionIdentifier: $transactionIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplePaymentModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionIdentifier, transactionIdentifier) ||
                other.transactionIdentifier == transactionIdentifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, paymentMethod, transactionIdentifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplePaymentModelImplCopyWith<_$ApplePaymentModelImpl> get copyWith =>
      __$$ApplePaymentModelImplCopyWithImpl<_$ApplePaymentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplePaymentModelImplToJson(
      this,
    );
  }
}

abstract class _ApplePaymentModel extends ApplePaymentModel {
  factory _ApplePaymentModel(
      {final String? token,
      final PaymentMethod? paymentMethod,
      final String? transactionIdentifier}) = _$ApplePaymentModelImpl;
  _ApplePaymentModel._() : super._();

  factory _ApplePaymentModel.fromJson(Map<String, dynamic> json) =
      _$ApplePaymentModelImpl.fromJson;

  @override
  String? get token;
  @override
  PaymentMethod? get paymentMethod;
  @override
  String? get transactionIdentifier;
  @override
  @JsonKey(ignore: true)
  _$$ApplePaymentModelImplCopyWith<_$ApplePaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String? get displayName => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call({String? displayName, String? network, int? type});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? network = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayName, String? network, int? type});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? network = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  _$PaymentMethodImpl({this.displayName, this.network, this.type});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String? displayName;
  @override
  final String? network;
  @override
  final int? type;

  @override
  String toString() {
    return 'PaymentMethod(displayName: $displayName, network: $network, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, network, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod(
      {final String? displayName,
      final String? network,
      final int? type}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String? get displayName;
  @override
  String? get network;
  @override
  int? get type;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
