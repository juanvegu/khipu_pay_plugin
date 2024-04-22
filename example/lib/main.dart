import 'package:flutter/material.dart';

import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KhipuPay.initialize(
    keyMode: KeyMode.normal, 
    khipuId: 'khipuId', 
    khipuSecret: 'khipuSecret'
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
