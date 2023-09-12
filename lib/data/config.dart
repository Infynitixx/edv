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
    var checkUrl = await this.checkUrl();
    if (checkUrl == true) {
      return await this.getUrl();
    } else {
      return "Keine URL hinterlegt!";
    }
  }

  Future<void> setUrl(String url) async {
    await storage.write(key: 'url', value: url);
  }

  Future<int> testUrl() async {
    String? baseUrl = await getUrl();

    if (baseUrl != null) {
      var url = Uri.parse("$baseUrl/test");

      try {
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          var testResult = json.decode(response.body) as Map<String, dynamic>; // Änderung hier
          var success = testResult['success'] as int; // Änderung hier
          return success;
        } else if (response.statusCode == 404) { // Korrektur hier
          var success = 0;
          return success;
        } else { // Hinzugefügt
          var success = 0;
          return success;
        }
      } catch (e) {
        // Ein Fehler ist aufgetreten, z.B. beim Parsen des JSON.
        // Hier können Sie eine Fehlermeldung zurückgeben oder eine andere Aktion ausführen.
        return 0;
      }
    } else {
      // Behandeln Sie den Fall, in dem die URL null ist.
      // Hier können Sie eine Fehlermeldung zurückgeben oder eine andere Aktion ausführen.
      return 0;
    }
  }
}