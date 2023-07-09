import 'package:flutter/foundation.dart';
import 'package:edv/data/userRepository.dart';
import 'package:edv/model/user.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  final List<User> _users = [];

  List<User> get users => _users;

  Future<void> loadUsers() async {
    final users = await _userRepository.fetchUsers();
    _users.addAll(users);
    notifyListeners();


  }
}