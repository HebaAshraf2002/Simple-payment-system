import 'package:simplepaymentsystem/PaymentMethod.dart';

class PaymentProcessor {
  final PaymentMethod paymentMethod;

  PaymentProcessor(this.paymentMethod);

  void processPayment(double amount) {
    paymentMethod.pay(amount);
  }
}