import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_payment_model.g.dart';

part 'apple_payment_model.freezed.dart';

@freezed
class ApplePaymentModel with _$ApplePaymentModel {
  ApplePaymentModel._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory ApplePaymentModel({
    String? token,
    PaymentMethod? paymentMethod,
    String? transactionIdentifier,
  }) = _ApplePaymentModel;

  factory ApplePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ApplePaymentModelFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  factory PaymentMethod({
    String? displayName,
    String? network,
    int? type,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
