// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GooglePaymentModel _$GooglePaymentModelFromJson(Map<String, dynamic> json) {
  return _GooglePaymentModel.fromJson(json);
}

/// @nodoc
mixin _$GooglePaymentModel {
  int? get apiVersion => throw _privateConstructorUsedError;
  int? get apiVersionMinor => throw _privateConstructorUsedError;
  PaymentMethodData? get paymentMethodData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GooglePaymentModelCopyWith<GooglePaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooglePaymentModelCopyWith<$Res> {
  factory $GooglePaymentModelCopyWith(
          GooglePaymentModel value, $Res Function(GooglePaymentModel) then) =
      _$GooglePaymentModelCopyWithImpl<$Res, GooglePaymentModel>;
  @useResult
  $Res call(
      {int? apiVersion,
      int? apiVersionMinor,
      PaymentMethodData? paymentMethodData});

  $PaymentMethodDataCopyWith<$Res>? get paymentMethodData;
}

/// @nodoc
class _$GooglePaymentModelCopyWithImpl<$Res, $Val extends GooglePaymentModel>
    implements $GooglePaymentModelCopyWith<$Res> {
  _$GooglePaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = freezed,
    Object? apiVersionMinor = freezed,
    Object? paymentMethodData = freezed,
  }) {
    return _then(_value.copyWith(
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      apiVersionMinor: freezed == apiVersionMinor
          ? _value.apiVersionMinor
          : apiVersionMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodData: freezed == paymentMethodData
          ? _value.paymentMethodData
          : paymentMethodData // ignore: cast_nullable_to_non_nullable
              as PaymentMethodData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodDataCopyWith<$Res>? get paymentMethodData {
    if (_value.paymentMethodData == null) {
      return null;
    }

    return $PaymentMethodDataCopyWith<$Res>(_value.paymentMethodData!, (value) {
      return _then(_value.copyWith(paymentMethodData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GooglePaymentModelImplCopyWith<$Res>
    implements $GooglePaymentModelCopyWith<$Res> {
  factory _$$GooglePaymentModelImplCopyWith(_$GooglePaymentModelImpl value,
          $Res Function(_$GooglePaymentModelImpl) then) =
      __$$GooglePaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? apiVersion,
      int? apiVersionMinor,
      PaymentMethodData? paymentMethodData});

  @override
  $PaymentMethodDataCopyWith<$Res>? get paymentMethodData;
}

/// @nodoc
class __$$GooglePaymentModelImplCopyWithImpl<$Res>
    extends _$GooglePaymentModelCopyWithImpl<$Res, _$GooglePaymentModelImpl>
    implements _$$GooglePaymentModelImplCopyWith<$Res> {
  __$$GooglePaymentModelImplCopyWithImpl(_$GooglePaymentModelImpl _value,
      $Res Function(_$GooglePaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = freezed,
    Object? apiVersionMinor = freezed,
    Object? paymentMethodData = freezed,
  }) {
    return _then(_$GooglePaymentModelImpl(
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      apiVersionMinor: freezed == apiVersionMinor
          ? _value.apiVersionMinor
          : apiVersionMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodData: freezed == paymentMethodData
          ? _value.paymentMethodData
          : paymentMethodData // ignore: cast_nullable_to_non_nullable
              as PaymentMethodData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GooglePaymentModelImpl implements _GooglePaymentModel {
  _$GooglePaymentModelImpl(
      {this.apiVersion, this.apiVersionMinor, this.paymentMethodData});

  factory _$GooglePaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GooglePaymentModelImplFromJson(json);

  @override
  final int? apiVersion;
  @override
  final int? apiVersionMinor;
  @override
  final PaymentMethodData? paymentMethodData;

  @override
  String toString() {
    return 'GooglePaymentModel(apiVersion: $apiVersion, apiVersionMinor: $apiVersionMinor, paymentMethodData: $paymentMethodData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GooglePaymentModelImpl &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion) &&
            (identical(other.apiVersionMinor, apiVersionMinor) ||
                other.apiVersionMinor == apiVersionMinor) &&
            (identical(other.paymentMethodData, paymentMethodData) ||
                other.paymentMethodData == paymentMethodData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, apiVersion, apiVersionMinor, paymentMethodData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GooglePaymentModelImplCopyWith<_$GooglePaymentModelImpl> get copyWith =>
      __$$GooglePaymentModelImplCopyWithImpl<_$GooglePaymentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GooglePaymentModelImplToJson(
      this,
    );
  }
}

abstract class _GooglePaymentModel implements GooglePaymentModel {
  factory _GooglePaymentModel(
      {final int? apiVersion,
      final int? apiVersionMinor,
      final PaymentMethodData? paymentMethodData}) = _$GooglePaymentModelImpl;

  factory _GooglePaymentModel.fromJson(Map<String, dynamic> json) =
      _$GooglePaymentModelImpl.fromJson;

  @override
  int? get apiVersion;
  @override
  int? get apiVersionMinor;
  @override
  PaymentMethodData? get paymentMethodData;
  @override
  @JsonKey(ignore: true)
  _$$GooglePaymentModelImplCopyWith<_$GooglePaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodData _$PaymentMethodDataFromJson(Map<String, dynamic> json) {
  return _PaymentMethodData.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodData {
  String? get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  PaymentMethodTokenizationData? get tokenizationData =>
      throw _privateConstructorUsedError;
  CardInfo? get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodDataCopyWith<PaymentMethodData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodDataCopyWith<$Res> {
  factory $PaymentMethodDataCopyWith(
          PaymentMethodData value, $Res Function(PaymentMethodData) then) =
      _$PaymentMethodDataCopyWithImpl<$Res, PaymentMethodData>;
  @useResult
  $Res call(
      {String? type,
      String? description,
      PaymentMethodTokenizationData? tokenizationData,
      CardInfo? info});

  $PaymentMethodTokenizationDataCopyWith<$Res>? get tokenizationData;
  $CardInfoCopyWith<$Res>? get info;
}

/// @nodoc
class _$PaymentMethodDataCopyWithImpl<$Res, $Val extends PaymentMethodData>
    implements $PaymentMethodDataCopyWith<$Res> {
  _$PaymentMethodDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? description = freezed,
    Object? tokenizationData = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenizationData: freezed == tokenizationData
          ? _value.tokenizationData
          : tokenizationData // ignore: cast_nullable_to_non_nullable
              as PaymentMethodTokenizationData?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CardInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodTokenizationDataCopyWith<$Res>? get tokenizationData {
    if (_value.tokenizationData == null) {
      return null;
    }

    return $PaymentMethodTokenizationDataCopyWith<$Res>(
        _value.tokenizationData!, (value) {
      return _then(_value.copyWith(tokenizationData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardInfoCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $CardInfoCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodDataImplCopyWith<$Res>
    implements $PaymentMethodDataCopyWith<$Res> {
  factory _$$PaymentMethodDataImplCopyWith(_$PaymentMethodDataImpl value,
          $Res Function(_$PaymentMethodDataImpl) then) =
      __$$PaymentMethodDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? description,
      PaymentMethodTokenizationData? tokenizationData,
      CardInfo? info});

  @override
  $PaymentMethodTokenizationDataCopyWith<$Res>? get tokenizationData;
  @override
  $CardInfoCopyWith<$Res>? get info;
}

/// @nodoc
class __$$PaymentMethodDataImplCopyWithImpl<$Res>
    extends _$PaymentMethodDataCopyWithImpl<$Res, _$PaymentMethodDataImpl>
    implements _$$PaymentMethodDataImplCopyWith<$Res> {
  __$$PaymentMethodDataImplCopyWithImpl(_$PaymentMethodDataImpl _value,
      $Res Function(_$PaymentMethodDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? description = freezed,
    Object? tokenizationData = freezed,
    Object? info = freezed,
  }) {
    return _then(_$PaymentMethodDataImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenizationData: freezed == tokenizationData
          ? _value.tokenizationData
          : tokenizationData // ignore: cast_nullable_to_non_nullable
              as PaymentMethodTokenizationData?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CardInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodDataImpl implements _PaymentMethodData {
  _$PaymentMethodDataImpl(
      {this.type, this.description, this.tokenizationData, this.info});

  factory _$PaymentMethodDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodDataImplFromJson(json);

  @override
  final String? type;
  @override
  final String? description;
  @override
  final PaymentMethodTokenizationData? tokenizationData;
  @override
  final CardInfo? info;

  @override
  String toString() {
    return 'PaymentMethodData(type: $type, description: $description, tokenizationData: $tokenizationData, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tokenizationData, tokenizationData) ||
                other.tokenizationData == tokenizationData) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, description, tokenizationData, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodDataImplCopyWith<_$PaymentMethodDataImpl> get copyWith =>
      __$$PaymentMethodDataImplCopyWithImpl<_$PaymentMethodDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodData implements PaymentMethodData {
  factory _PaymentMethodData(
      {final String? type,
      final String? description,
      final PaymentMethodTokenizationData? tokenizationData,
      final CardInfo? info}) = _$PaymentMethodDataImpl;

  factory _PaymentMethodData.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodDataImpl.fromJson;

  @override
  String? get type;
  @override
  String? get description;
  @override
  PaymentMethodTokenizationData? get tokenizationData;
  @override
  CardInfo? get info;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodDataImplCopyWith<_$PaymentMethodDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodTokenizationData _$PaymentMethodTokenizationDataFromJson(
    Map<String, dynamic> json) {
  return _PaymentMethodTokenizationData.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodTokenizationData {
  String? get type => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodTokenizationDataCopyWith<PaymentMethodTokenizationData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodTokenizationDataCopyWith<$Res> {
  factory $PaymentMethodTokenizationDataCopyWith(
          PaymentMethodTokenizationData value,
          $Res Function(PaymentMethodTokenizationData) then) =
      _$PaymentMethodTokenizationDataCopyWithImpl<$Res,
          PaymentMethodTokenizationData>;
  @useResult
  $Res call({String? type, String? token});
}

/// @nodoc
class _$PaymentMethodTokenizationDataCopyWithImpl<$Res,
        $Val extends PaymentMethodTokenizationData>
    implements $PaymentMethodTokenizationDataCopyWith<$Res> {
  _$PaymentMethodTokenizationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodTokenizationDataImplCopyWith<$Res>
    implements $PaymentMethodTokenizationDataCopyWith<$Res> {
  factory _$$PaymentMethodTokenizationDataImplCopyWith(
          _$PaymentMethodTokenizationDataImpl value,
          $Res Function(_$PaymentMethodTokenizationDataImpl) then) =
      __$$PaymentMethodTokenizationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? token});
}

/// @nodoc
class __$$PaymentMethodTokenizationDataImplCopyWithImpl<$Res>
    extends _$PaymentMethodTokenizationDataCopyWithImpl<$Res,
        _$PaymentMethodTokenizationDataImpl>
    implements _$$PaymentMethodTokenizationDataImplCopyWith<$Res> {
  __$$PaymentMethodTokenizationDataImplCopyWithImpl(
      _$PaymentMethodTokenizationDataImpl _value,
      $Res Function(_$PaymentMethodTokenizationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? token = freezed,
  }) {
    return _then(_$PaymentMethodTokenizationDataImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodTokenizationDataImpl
    implements _PaymentMethodTokenizationData {
  _$PaymentMethodTokenizationDataImpl({this.type, this.token});

  factory _$PaymentMethodTokenizationDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaymentMethodTokenizationDataImplFromJson(json);

  @override
  final String? type;
  @override
  final String? token;

  @override
  String toString() {
    return 'PaymentMethodTokenizationData(type: $type, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodTokenizationDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodTokenizationDataImplCopyWith<
          _$PaymentMethodTokenizationDataImpl>
      get copyWith => __$$PaymentMethodTokenizationDataImplCopyWithImpl<
          _$PaymentMethodTokenizationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodTokenizationDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodTokenizationData
    implements PaymentMethodTokenizationData {
  factory _PaymentMethodTokenizationData(
      {final String? type,
      final String? token}) = _$PaymentMethodTokenizationDataImpl;

  factory _PaymentMethodTokenizationData.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodTokenizationDataImpl.fromJson;

  @override
  String? get type;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodTokenizationDataImplCopyWith<
          _$PaymentMethodTokenizationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) {
  return _CardInfo.fromJson(json);
}

/// @nodoc
mixin _$CardInfo {
  String? get cardDetails => throw _privateConstructorUsedError;
  String? get cardNetwork => throw _privateConstructorUsedError;
  AssuranceDetailsSpecifications? get assuranceDetails =>
      throw _privateConstructorUsedError;
  Address? get billingAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardInfoCopyWith<CardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardInfoCopyWith<$Res> {
  factory $CardInfoCopyWith(CardInfo value, $Res Function(CardInfo) then) =
      _$CardInfoCopyWithImpl<$Res, CardInfo>;
  @useResult
  $Res call(
      {String? cardDetails,
      String? cardNetwork,
      AssuranceDetailsSpecifications? assuranceDetails,
      Address? billingAddress});

  $AssuranceDetailsSpecificationsCopyWith<$Res>? get assuranceDetails;
  $AddressCopyWith<$Res>? get billingAddress;
}

/// @nodoc
class _$CardInfoCopyWithImpl<$Res, $Val extends CardInfo>
    implements $CardInfoCopyWith<$Res> {
  _$CardInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardDetails = freezed,
    Object? cardNetwork = freezed,
    Object? assuranceDetails = freezed,
    Object? billingAddress = freezed,
  }) {
    return _then(_value.copyWith(
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNetwork: freezed == cardNetwork
          ? _value.cardNetwork
          : cardNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      assuranceDetails: freezed == assuranceDetails
          ? _value.assuranceDetails
          : assuranceDetails // ignore: cast_nullable_to_non_nullable
              as AssuranceDetailsSpecifications?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssuranceDetailsSpecificationsCopyWith<$Res>? get assuranceDetails {
    if (_value.assuranceDetails == null) {
      return null;
    }

    return $AssuranceDetailsSpecificationsCopyWith<$Res>(
        _value.assuranceDetails!, (value) {
      return _then(_value.copyWith(assuranceDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardInfoImplCopyWith<$Res>
    implements $CardInfoCopyWith<$Res> {
  factory _$$CardInfoImplCopyWith(
          _$CardInfoImpl value, $Res Function(_$CardInfoImpl) then) =
      __$$CardInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cardDetails,
      String? cardNetwork,
      AssuranceDetailsSpecifications? assuranceDetails,
      Address? billingAddress});

  @override
  $AssuranceDetailsSpecificationsCopyWith<$Res>? get assuranceDetails;
  @override
  $AddressCopyWith<$Res>? get billingAddress;
}

/// @nodoc
class __$$CardInfoImplCopyWithImpl<$Res>
    extends _$CardInfoCopyWithImpl<$Res, _$CardInfoImpl>
    implements _$$CardInfoImplCopyWith<$Res> {
  __$$CardInfoImplCopyWithImpl(
      _$CardInfoImpl _value, $Res Function(_$CardInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardDetails = freezed,
    Object? cardNetwork = freezed,
    Object? assuranceDetails = freezed,
    Object? billingAddress = freezed,
  }) {
    return _then(_$CardInfoImpl(
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNetwork: freezed == cardNetwork
          ? _value.cardNetwork
          : cardNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      assuranceDetails: freezed == assuranceDetails
          ? _value.assuranceDetails
          : assuranceDetails // ignore: cast_nullable_to_non_nullable
              as AssuranceDetailsSpecifications?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardInfoImpl implements _CardInfo {
  _$CardInfoImpl(
      {this.cardDetails,
      this.cardNetwork,
      this.assuranceDetails,
      this.billingAddress});

  factory _$CardInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardInfoImplFromJson(json);

  @override
  final String? cardDetails;
  @override
  final String? cardNetwork;
  @override
  final AssuranceDetailsSpecifications? assuranceDetails;
  @override
  final Address? billingAddress;

  @override
  String toString() {
    return 'CardInfo(cardDetails: $cardDetails, cardNetwork: $cardNetwork, assuranceDetails: $assuranceDetails, billingAddress: $billingAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardInfoImpl &&
            (identical(other.cardDetails, cardDetails) ||
                other.cardDetails == cardDetails) &&
            (identical(other.cardNetwork, cardNetwork) ||
                other.cardNetwork == cardNetwork) &&
            (identical(other.assuranceDetails, assuranceDetails) ||
                other.assuranceDetails == assuranceDetails) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cardDetails, cardNetwork, assuranceDetails, billingAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardInfoImplCopyWith<_$CardInfoImpl> get copyWith =>
      __$$CardInfoImplCopyWithImpl<_$CardInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardInfoImplToJson(
      this,
    );
  }
}

abstract class _CardInfo implements CardInfo {
  factory _CardInfo(
      {final String? cardDetails,
      final String? cardNetwork,
      final AssuranceDetailsSpecifications? assuranceDetails,
      final Address? billingAddress}) = _$CardInfoImpl;

  factory _CardInfo.fromJson(Map<String, dynamic> json) =
      _$CardInfoImpl.fromJson;

  @override
  String? get cardDetails;
  @override
  String? get cardNetwork;
  @override
  AssuranceDetailsSpecifications? get assuranceDetails;
  @override
  Address? get billingAddress;
  @override
  @JsonKey(ignore: true)
  _$$CardInfoImplCopyWith<_$CardInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssuranceDetailsSpecifications _$AssuranceDetailsSpecificationsFromJson(
    Map<String, dynamic> json) {
  return _AssuranceDetailsSpecifications.fromJson(json);
}

/// @nodoc
mixin _$AssuranceDetailsSpecifications {
  String? get cardDetails => throw _privateConstructorUsedError;
  String? get cardNetwork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssuranceDetailsSpecificationsCopyWith<AssuranceDetailsSpecifications>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssuranceDetailsSpecificationsCopyWith<$Res> {
  factory $AssuranceDetailsSpecificationsCopyWith(
          AssuranceDetailsSpecifications value,
          $Res Function(AssuranceDetailsSpecifications) then) =
      _$AssuranceDetailsSpecificationsCopyWithImpl<$Res,
          AssuranceDetailsSpecifications>;
  @useResult
  $Res call({String? cardDetails, String? cardNetwork});
}

/// @nodoc
class _$AssuranceDetailsSpecificationsCopyWithImpl<$Res,
        $Val extends AssuranceDetailsSpecifications>
    implements $AssuranceDetailsSpecificationsCopyWith<$Res> {
  _$AssuranceDetailsSpecificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardDetails = freezed,
    Object? cardNetwork = freezed,
  }) {
    return _then(_value.copyWith(
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNetwork: freezed == cardNetwork
          ? _value.cardNetwork
          : cardNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssuranceDetailsSpecificationsImplCopyWith<$Res>
    implements $AssuranceDetailsSpecificationsCopyWith<$Res> {
  factory _$$AssuranceDetailsSpecificationsImplCopyWith(
          _$AssuranceDetailsSpecificationsImpl value,
          $Res Function(_$AssuranceDetailsSpecificationsImpl) then) =
      __$$AssuranceDetailsSpecificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cardDetails, String? cardNetwork});
}

/// @nodoc
class __$$AssuranceDetailsSpecificationsImplCopyWithImpl<$Res>
    extends _$AssuranceDetailsSpecificationsCopyWithImpl<$Res,
        _$AssuranceDetailsSpecificationsImpl>
    implements _$$AssuranceDetailsSpecificationsImplCopyWith<$Res> {
  __$$AssuranceDetailsSpecificationsImplCopyWithImpl(
      _$AssuranceDetailsSpecificationsImpl _value,
      $Res Function(_$AssuranceDetailsSpecificationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardDetails = freezed,
    Object? cardNetwork = freezed,
  }) {
    return _then(_$AssuranceDetailsSpecificationsImpl(
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNetwork: freezed == cardNetwork
          ? _value.cardNetwork
          : cardNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssuranceDetailsSpecificationsImpl
    implements _AssuranceDetailsSpecifications {
  _$AssuranceDetailsSpecificationsImpl({this.cardDetails, this.cardNetwork});

  factory _$AssuranceDetailsSpecificationsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AssuranceDetailsSpecificationsImplFromJson(json);

  @override
  final String? cardDetails;
  @override
  final String? cardNetwork;

  @override
  String toString() {
    return 'AssuranceDetailsSpecifications(cardDetails: $cardDetails, cardNetwork: $cardNetwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssuranceDetailsSpecificationsImpl &&
            (identical(other.cardDetails, cardDetails) ||
                other.cardDetails == cardDetails) &&
            (identical(other.cardNetwork, cardNetwork) ||
                other.cardNetwork == cardNetwork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardDetails, cardNetwork);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssuranceDetailsSpecificationsImplCopyWith<
          _$AssuranceDetailsSpecificationsImpl>
      get copyWith => __$$AssuranceDetailsSpecificationsImplCopyWithImpl<
          _$AssuranceDetailsSpecificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssuranceDetailsSpecificationsImplToJson(
      this,
    );
  }
}

abstract class _AssuranceDetailsSpecifications
    implements AssuranceDetailsSpecifications {
  factory _AssuranceDetailsSpecifications(
      {final String? cardDetails,
      final String? cardNetwork}) = _$AssuranceDetailsSpecificationsImpl;

  factory _AssuranceDetailsSpecifications.fromJson(Map<String, dynamic> json) =
      _$AssuranceDetailsSpecificationsImpl.fromJson;

  @override
  String? get cardDetails;
  @override
  String? get cardNetwork;
  @override
  @JsonKey(ignore: true)
  _$$AssuranceDetailsSpecificationsImplCopyWith<
          _$AssuranceDetailsSpecificationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get name => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get address3 => throw _privateConstructorUsedError;
  String? get locality => throw _privateConstructorUsedError;
  String? get administrativeArea => throw _privateConstructorUsedError;
  String? get sortingCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? name,
      String? postalCode,
      String? countryCode,
      String? phoneNumber,
      String? address1,
      String? address2,
      String? address3,
      String? locality,
      String? administrativeArea,
      String? sortingCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? postalCode = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? locality = freezed,
    Object? administrativeArea = freezed,
    Object? sortingCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: freezed == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      sortingCode: freezed == sortingCode
          ? _value.sortingCode
          : sortingCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? postalCode,
      String? countryCode,
      String? phoneNumber,
      String? address1,
      String? address2,
      String? address3,
      String? locality,
      String? administrativeArea,
      String? sortingCode});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? postalCode = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? locality = freezed,
    Object? administrativeArea = freezed,
    Object? sortingCode = freezed,
  }) {
    return _then(_$AddressImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: freezed == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      sortingCode: freezed == sortingCode
          ? _value.sortingCode
          : sortingCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  _$AddressImpl(
      {this.name,
      this.postalCode,
      this.countryCode,
      this.phoneNumber,
      this.address1,
      this.address2,
      this.address3,
      this.locality,
      this.administrativeArea,
      this.sortingCode});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? name;
  @override
  final String? postalCode;
  @override
  final String? countryCode;
  @override
  final String? phoneNumber;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? address3;
  @override
  final String? locality;
  @override
  final String? administrativeArea;
  @override
  final String? sortingCode;

  @override
  String toString() {
    return 'Address(name: $name, postalCode: $postalCode, countryCode: $countryCode, phoneNumber: $phoneNumber, address1: $address1, address2: $address2, address3: $address3, locality: $locality, administrativeArea: $administrativeArea, sortingCode: $sortingCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.administrativeArea, administrativeArea) ||
                other.administrativeArea == administrativeArea) &&
            (identical(other.sortingCode, sortingCode) ||
                other.sortingCode == sortingCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      postalCode,
      countryCode,
      phoneNumber,
      address1,
      address2,
      address3,
      locality,
      administrativeArea,
      sortingCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {final String? name,
      final String? postalCode,
      final String? countryCode,
      final String? phoneNumber,
      final String? address1,
      final String? address2,
      final String? address3,
      final String? locality,
      final String? administrativeArea,
      final String? sortingCode}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get name;
  @override
  String? get postalCode;
  @override
  String? get countryCode;
  @override
  String? get phoneNumber;
  @override
  String? get address1;
  @override
  String? get address2;
  @override
  String? get address3;
  @override
  String? get locality;
  @override
  String? get administrativeArea;
  @override
  String? get sortingCode;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
