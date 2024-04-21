import 'package:flutter/material.dart';
import 'dart:async';

import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KhipuPay.initialize();
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => {},
            child: const Text("Presionar"),
          ),
        ),
      ),
    );
  }
}
