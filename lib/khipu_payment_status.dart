import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khipu_pay_plugin/encrypt_data.dart';

class KhipuPaymentStatus {
  EncryptData encryptData = new EncryptData();

  Future<String?> status({
    required String transactionCode,
    required String id,
    required String secret,
  }) async {
    if (transactionCode != null && transactionCode.isEmpty) {
      throw ArgumentError.value(
          transactionCode, 'transactionCode cannot be empty or null');
    }

    if (id != null && id.isEmpty) {
      throw ArgumentError.value(id, 'id cannot be empty or null');
    }

    if (secret != null && secret.isEmpty) {
      throw ArgumentError.value(secret, 'secret cannot be empty or null');
    }

    String method = "GET";
    String url = "https://khipu.com/api/2.0/payments/" + transactionCode;

    var toSign = new StringBuffer(
        method.toUpperCase() + "&" + encryptData.percentEncode(url));

    String sign = encryptData.hmacSHA256(secret, toSign.toString());
    String authorization = '$id' + ':' + sign;

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': authorization,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map responseMap = json.decode(response.body);
      print("responseMap.status: " + responseMap['status']);
      return responseMap['status'];
    } else {
      print("response.body: " + response.body);
      return '';
    }
  }
}
