import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_payment_model.g.dart';

part 'google_payment_model.freezed.dart';

@freezed
class GooglePaymentModel with _$GooglePaymentModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory GooglePaymentModel({
    int? apiVersion,
    int? apiVersionMinor,
    PaymentMethodData? paymentMethodData,
  }) = _GooglePaymentModel;

  factory GooglePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$GooglePaymentModelFromJson(json);
}

@freezed
class PaymentMethodData with _$PaymentMethodData {
  factory PaymentMethodData({
    String? type,
    String? description,
    PaymentMethodTokenizationData? tokenizationData,
    CardInfo? info,
  }) = _PaymentMethodData;

  factory PaymentMethodData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDataFromJson(json);
}

@freezed
class PaymentMethodTokenizationData with _$PaymentMethodTokenizationData {
  factory PaymentMethodTokenizationData({
    String? type,
    String? token,
  }) = _PaymentMethodTokenizationData;

  factory PaymentMethodTokenizationData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodTokenizationDataFromJson(json);
}

@freezed
class CardInfo with _$CardInfo {
  factory CardInfo({
    String? cardDetails,
    String? cardNetwork,
    AssuranceDetailsSpecifications? assuranceDetails,
    Address? billingAddress,
  }) = _CardInfo;

  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);
}

@freezed
class AssuranceDetailsSpecifications with _$AssuranceDetailsSpecifications {
  factory AssuranceDetailsSpecifications({
    String? cardDetails,
    String? cardNetwork,
  }) = _AssuranceDetailsSpecifications;

  factory AssuranceDetailsSpecifications.fromJson(Map<String, dynamic> json) =>
      _$AssuranceDetailsSpecificationsFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    String? name,
    String? postalCode,
    String? countryCode,
    String? phoneNumber,
    String? address1,
    String? address2,
    String? address3,
    String? locality,
    String? administrativeArea,
    String? sortingCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
