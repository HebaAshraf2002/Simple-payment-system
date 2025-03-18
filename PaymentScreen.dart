import 'package:flutter/material.dart';
import 'package:simplepaymentsystem/CashPayment.dart';
import 'package:simplepaymentsystem/CreditCardPayment.dart';
import 'package:simplepaymentsystem/PaymentMethod.dart';
import 'package:simplepaymentsystem/PaymentProcessor.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentProcessor? _paymentProcessor;
  double amount = 100.0;

  void _selectPaymentMethod(PaymentMethod method) {
    setState(() {
      _paymentProcessor = PaymentProcessor(method);
    });
  }

  void _processPayment() {
    if (_paymentProcessor != null) {
      _paymentProcessor!.processPayment(amount);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Payment of \$$amount processed successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select a payment method first!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Simple Payment System",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select Payment Method:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectPaymentMethod(CashPayment()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Pay with Cash",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  _selectPaymentMethod(CreditCardPayment("1234-5678-9876")),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Pay with Credit Card",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _processPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Process Payment",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
