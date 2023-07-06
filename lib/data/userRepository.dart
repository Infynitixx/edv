import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edv/model/user.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse('http://172.16.0.162/api/user'));

    List<User> users = [];

    if (response.statusCode == 200) {
      var userJson = json.decode(response.body);

      for (var jsondata in userJson) {
        users.add(User.fromJson(jsondata));
      }
    }
    return users;
  }
}