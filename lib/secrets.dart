import 'dart:convert';
import 'package:flutter/services.dart';

class Secret {
  final String webApiKey;
  final String androidApiKey;
  final String iosApiKey;

  Secret({required this.webApiKey, required this.iosApiKey, required this.androidApiKey});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(webApiKey: jsonMap["web_api_key"], iosApiKey: jsonMap["ios_api_key"], androidApiKey: jsonMap["android_api_key"]);
  }
}

class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});

  Future<Secret> load() async {
    final secretContents = await rootBundle.loadString(secretPath);
    final secret = Secret.fromJson(json.decode(secretContents));
    return secret;
  }
}