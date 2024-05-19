import 'package:flutter/material.dart';

import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';

import 'widget/ticket_card.dart';

void main() {
  KhipuPay.initialize(
    keyMode: KeyMode.normal, 
    apiKey: 'asdasd',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: TicketCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('KhipuPay Plugin',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  final response = await KhipuPay.instance.createPayment(KhipuPaymentForm(
                    subject: 'Test Payment',
                    amount: 1000,
                    currency: 'CLP',
                    transactionId: '123',
                    payerName: 'John Doe',
                  ));
                  print(response.paymentId);
                },
                child: const Text('Create Payment'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final paymentID = await KhipuPay.instance.processPayment(paymentId: 'asdasdasd');
                  print(paymentID);
                },
                child: const Text('Launch Khipu'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final _ = await KhipuPay.instance.paymentStatus(paymentId: 'ytzknrfnuljw');
                },
                child: const Text('Get Payment Status'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
