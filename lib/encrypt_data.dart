import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptData {
  String percentEncode(String? url) {
    if (url == null) {
      return "";
    } else {
      return Uri.encodeComponent(url);
    }
  }

  String hmacSHA256(String secret, String toSign) {
    if (secret.isEmpty || toSign.isEmpty) {
      return "";
    }

    var key = utf8.encode(secret);
    var bytes = utf8.encode(toSign);

    var hmacSha256 = new Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
