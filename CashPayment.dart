import 'package:simplepaymentsystem/PaymentMethod.dart';

class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$${amount} in cash.");
  }
}