import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edv/model/group.dart';

class GroupRepository {
  Future<List<Group>> fetchGroups() async {
    var response = await http.get(Uri.parse('http://192.168.178.107/api/group'));

    List<Group> groups = [];

    if (response.statusCode == 200) {
      var groupJson = json.decode(response.body);

      for (var jsondata in groupJson) {
        groups.add(Group.fromJson(jsondata));
      }
    }
    return groups;
  }
}