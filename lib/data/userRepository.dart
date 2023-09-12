import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edv/model/user.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse('http://localhost/api/user'));

    List<User> users = [];

    if (response.statusCode == 200) {
      var userJson = json.decode(response.body);

      for (var jsondata in userJson) {
        users.add(User.fromJson(jsondata));
      }
    }
    return users;
  }

  Future<User> createUser(User newUser) async {
    var url = Uri.parse('https://eoet0ncq43aokkb.m.pipedream.net');

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newUser.toJson()),
    );

    if (response.statusCode == 201) {
      var createdUserJson = json.decode(response.body);
      var createdUser = User.fromJson(createdUserJson);
      return createdUser;
    } else {
      throw Exception('Failed to create user');
    }
  }
}