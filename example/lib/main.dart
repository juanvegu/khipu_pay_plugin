import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:khipu_pay/khipu_pay.dart';
import 'package:khipu_pay/khipu_payment_status.dart';
import 'package:khipu_pay/khipu_payment.dart';

void main() {
  runApp(MyApp());
  KhipuPay.initialize(hexaColor: "#7F7094");
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String paymentId = "";
  String paymentStatus = "-";

  String id = "";
  String secret = "";

  @override
  void initState() {
    super.initState();

    if (kReleaseMode) {
      // Production Credentials
      id = "";
      secret = "";
    } else {
      // Development Credentials
      id = "257939";
      secret = "0ce6fdb700b7fe668cfde33d0311d87196f22f27";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('KhipuPay Plugin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.blueAccent,
                child: Text(
                  'Get payment ID',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  String idPayment = await KhipuPayment().getPaymentId(
                    id: id, //Information delivered by khipu
                    secret: secret, //Information delivered by khipu
                    subject: "Subject of payment",
                    amount: "1000",
                    currency: "CLP",
                  );

                  print('The payment ID is: $idPayment');

                  setState(() {
                    paymentId = idPayment;
                  });
                },
              ),
              MaterialButton(
                color: Colors.blueAccent,
                child: Text(
                  'Make payment for ID: $paymentId',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  String statusProcess =
                      await KhipuPay.paymentProcess(paymentId: paymentId);

                  print("Payment status is $statusProcess");
                },
              ),
              MaterialButton(
                color: Colors.green,
                child: Text(
                  'See Payment Status: $paymentId',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  paymentStatus = await KhipuPaymentStatus().status(
                    transactionCode: paymentId,
                    id: id, //Information delivered by khipu
                    secret: secret, //Information delivered by khipu
                  );

                  setState(() {});

                  print('Payment status is: $paymentStatus');
                },
              ),
              SizedBox(height: 30.0),
              Text("Payment status is: $paymentStatus"),
            ],
          ),
        ),
      ),
    );
  }
}
