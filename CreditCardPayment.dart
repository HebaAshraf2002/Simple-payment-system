import 'package:simplepaymentsystem/PaymentMethod.dart';

class CreditCardPayment implements PaymentMethod {
  final String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(double amount) {
    print("Paid \$${amount} using credit card: ${cardNumber}.");
  }
}
