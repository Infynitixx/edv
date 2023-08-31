import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Configuration {
  final storage = FlutterSecureStorage();

  Future<bool> checkUrl() async {
    String? url = await storage.read(key: 'url');
    return url != null;
  }

  Future<String?> getUrl() async {
    String? url = await storage.read(key: 'url');
    return url;
  }

  Future<String?> urlLabel() async {
    var checkUrl = await this.checkUrl(); // await hinzugefügt
    if (checkUrl == true) {
      return await this.getUrl(); // await hinzugefügt
    } else {
      return "Keine URL hinterlegt!";
    }
  }

  Future<void> setUrl(String url) async {
    await storage.write(key: 'token', value: url);
  }

  Future<int> testUrl(String baseUrl) async {
    var url = Uri.parse("$baseUrl./test");

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    var testResult = json.decode(response.body);
    var success = testResult['success'] ?? 0; // ['success'] hinzugefügt
    return success;
  }
}
