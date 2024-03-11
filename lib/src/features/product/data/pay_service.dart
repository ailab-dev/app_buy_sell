import 'package:app_buy_sell/src/features/product/data/pay_repository.dart';
import 'package:pay/pay.dart';

class PayService {
  PayRepository payRepository;

  PayService(this.payRepository);

  Future<Map<String, dynamic>> pay(List<PaymentItem> paymentItems) async {
    return await payRepository.pay(paymentItems);
  }
}
