import 'package:flutter/material.dart';

import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';

void main() {
  KhipuPay.initialize(
    keyMode: KeyMode.normal, 
    apiKey: 'c3a7ad13-0e0e-4aed-a695-24f39f021198',
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
        appBar: AppBar(
          title: const Text('KhipuPay Plugin'),
        ),
        body: Center(
          child: Text(KhipuPay.instance.processPayment()),
        ),
      ),
    );
  }
}
