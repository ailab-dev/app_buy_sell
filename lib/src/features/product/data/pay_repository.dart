import 'package:pay/pay.dart';

abstract class PayRepository {
  Future<Map<String, dynamic>> pay(List<PaymentItem> paymentItems);
}

class ApplePayImpl extends PayRepository {
  @override
  Future<Map<String, dynamic>> pay(List<PaymentItem> paymentItems) async {
    final applePayConfigFuture =
        await PaymentConfiguration.fromAsset('apple_pay_config.json');
    final Pay payClient = Pay({
      PayProvider.apple_pay: applePayConfigFuture,
    });
    return await payClient.showPaymentSelector(
      PayProvider.apple_pay,
      paymentItems,
    );
  }
}

class GoolePayImpl extends PayRepository {
  @override
  Future<Map<String, dynamic>> pay(List<PaymentItem> paymentItems) async {
    final googlePayConfigFuture =
        await PaymentConfiguration.fromAsset('google_pay_config.json');
    final Pay payClient = Pay({
      PayProvider.google_pay: googlePayConfigFuture,
    });
    return await payClient.showPaymentSelector(
      PayProvider.google_pay,
      paymentItems,
    );
  }
}
