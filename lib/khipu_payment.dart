import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:http/http.dart' as http;
import 'package:khipu_pay_plugin/encrypt_data.dart';

class KhipuPayment {
  EncryptData encryptData = new EncryptData();

  Future<String?> getPaymentId({
    required String id,
    required String secret,
    required String subject,
    required String amount,
    required String currency,
    String? email,
  }) async {
    validateFields(id, secret, subject, amount, currency, email);

    String method = "POST";
    var url = 'https://khipu.com/api/2.0/payments';

    var toSign = new StringBuffer(
        method.toUpperCase() + "&" + encryptData.percentEncode(url));

    Map parameters = new Map<String, dynamic>();
    parameters["subject"] = removeDiacritics(subject);
    parameters["amount"] = amount;
    parameters["currency"] = currency;
    if (email != null && email.isNotEmpty) parameters["payer_email"] = email;

    var sortedKeys = parameters.keys.toList()..sort();
    for (var key in sortedKeys) {
      toSign.write('&' +
          encryptData.percentEncode(key) +
          '=' +
          encryptData.percentEncode(parameters[key]));
    }

    String sign = encryptData.hmacSHA256(secret, toSign.toString());
    String authorization = '$id' + ':' + sign;

    var postData = new StringBuffer();
    for (var key in parameters.keys) {
      if (postData.length > 0) {
        postData.write('&' +
            encryptData.percentEncode(key) +
            '=' +
            encryptData.percentEncode(parameters[key]));
      } else {
        postData.write(encryptData.percentEncode(key) +
            '=' +
            encryptData.percentEncode(parameters[key]));
      }
    }

    var response = await http.post(
      Uri.parse('$url?${postData.toString()}'),
      headers: {
        'Authorization': authorization,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    final Map responseMap = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("paymentId: " + responseMap["payment_id"]);
      return responseMap["payment_id"];
    } else {
      print(responseMap);
      return null;
    }
  }

  void validateFields(
    String id,
    String secret,
    String subject,
    String amount,
    String currency,
    String? email,
  ) {
    if (id.isEmpty) {
      throw ArgumentError.value(id, 'id cannot be empty');
    }

    if (secret.isEmpty) {
      throw ArgumentError.value(secret, 'secret cannot be empty');
    }

    if (subject.isEmpty) {
      throw ArgumentError.value(subject, 'subject cannot be empty');
    }

    var amountInt = int.parse(amount);
    if (amount.isEmpty) {
      throw ArgumentError.value(amount, 'amount cannot be empty');
    } else if (amountInt is int && amountInt <= 0) {
      throw ArgumentError.value(
          amount, 'amount must be an int and greater than 0');
    }

    if (currency.isEmpty) {
      throw ArgumentError.value(currency, 'currency cannot be empty');
    }

    if (email != null && email.isNotEmpty && !validateEmail(email)) {
      throw ArgumentError.value(email, 'wrong email format');
    }
  }

  bool validateEmail(String email) {
    if (RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
