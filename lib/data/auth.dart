import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edv/model/login.dart';

class Authorization{
  final storage = new FlutterSecureStorage();
   getToken() async {
    String? token = await storage.read(key: 'token');
    print(token);
     return token;
  }
  Future<bool> checkToken() async {

    String? token = await storage.read(key: 'token');
    return token != null;
  }
  CheckLogin(Login login) async {
    var url = Uri.parse('http://localhost/api/login');

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(login.toJson()),
    );

    if (response.statusCode == 200) {
      var loginStatusJson = json.decode(response.body);
      final loginStatus = LoginStatus.fromJson(loginStatusJson);

      var status = loginStatus.success;
      var payload = loginStatus.payload;

      if (status == 1) {
        await storage.write(key: 'token', value: payload);
        return status;
      }
      else {
        print('Fehler:');
        print(payload);
        return status;
      }
    }
  }
}