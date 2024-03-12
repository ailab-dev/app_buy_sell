// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplePaymentModelImpl _$$ApplePaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplePaymentModelImpl(
      token: json['token'] as String?,
      paymentMethod: json['paymentMethod'] == null
          ? null
          : PaymentMethod.fromJson(
              json['paymentMethod'] as Map<String, dynamic>),
      transactionIdentifier: json['transactionIdentifier'] as String?,
    );

Map<String, dynamic> _$$ApplePaymentModelImplToJson(
        _$ApplePaymentModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'paymentMethod': instance.paymentMethod?.toJson(),
      'transactionIdentifier': instance.transactionIdentifier,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      displayName: json['displayName'] as String?,
      network: json['network'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'network': instance.network,
      'type': instance.type,
    };
