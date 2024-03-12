// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GooglePaymentModelImpl _$$GooglePaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GooglePaymentModelImpl(
      apiVersion: json['apiVersion'] as int?,
      apiVersionMinor: json['apiVersionMinor'] as int?,
      paymentMethodData: json['paymentMethodData'] == null
          ? null
          : PaymentMethodData.fromJson(
              json['paymentMethodData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GooglePaymentModelImplToJson(
        _$GooglePaymentModelImpl instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'apiVersionMinor': instance.apiVersionMinor,
      'paymentMethodData': instance.paymentMethodData?.toJson(),
    };

_$PaymentMethodDataImpl _$$PaymentMethodDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodDataImpl(
      type: json['type'] as String?,
      description: json['description'] as String?,
      tokenizationData: json['tokenizationData'] == null
          ? null
          : PaymentMethodTokenizationData.fromJson(
              json['tokenizationData'] as Map<String, dynamic>),
      info: json['info'] == null
          ? null
          : CardInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentMethodDataImplToJson(
        _$PaymentMethodDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'tokenizationData': instance.tokenizationData,
      'info': instance.info,
    };

_$PaymentMethodTokenizationDataImpl
    _$$PaymentMethodTokenizationDataImplFromJson(Map<String, dynamic> json) =>
        _$PaymentMethodTokenizationDataImpl(
          type: json['type'] as String?,
          token: json['token'] as String?,
        );

Map<String, dynamic> _$$PaymentMethodTokenizationDataImplToJson(
        _$PaymentMethodTokenizationDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'token': instance.token,
    };

_$CardInfoImpl _$$CardInfoImplFromJson(Map<String, dynamic> json) =>
    _$CardInfoImpl(
      cardDetails: json['cardDetails'] as String?,
      cardNetwork: json['cardNetwork'] as String?,
      assuranceDetails: json['assuranceDetails'] == null
          ? null
          : AssuranceDetailsSpecifications.fromJson(
              json['assuranceDetails'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CardInfoImplToJson(_$CardInfoImpl instance) =>
    <String, dynamic>{
      'cardDetails': instance.cardDetails,
      'cardNetwork': instance.cardNetwork,
      'assuranceDetails': instance.assuranceDetails,
      'billingAddress': instance.billingAddress,
    };

_$AssuranceDetailsSpecificationsImpl
    _$$AssuranceDetailsSpecificationsImplFromJson(Map<String, dynamic> json) =>
        _$AssuranceDetailsSpecificationsImpl(
          cardDetails: json['cardDetails'] as String?,
          cardNetwork: json['cardNetwork'] as String?,
        );

Map<String, dynamic> _$$AssuranceDetailsSpecificationsImplToJson(
        _$AssuranceDetailsSpecificationsImpl instance) =>
    <String, dynamic>{
      'cardDetails': instance.cardDetails,
      'cardNetwork': instance.cardNetwork,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['name'] as String?,
      postalCode: json['postalCode'] as String?,
      countryCode: json['countryCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      locality: json['locality'] as String?,
      administrativeArea: json['administrativeArea'] as String?,
      sortingCode: json['sortingCode'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'postalCode': instance.postalCode,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'locality': instance.locality,
      'administrativeArea': instance.administrativeArea,
      'sortingCode': instance.sortingCode,
    };
