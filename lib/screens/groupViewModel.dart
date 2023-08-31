import 'package:flutter/foundation.dart';
import 'package:edv/data/groupRepository.dart';
import 'package:edv/model/group.dart';

class GroupViewModel extends ChangeNotifier {
  final GroupRepository _groupRepository = GroupRepository();
  final List<Group> _groups = [];

  List<Group> get groups => _groups;

  Future<void> loadGroups() async {
    final groups = await _groupRepository.fetchGroups();
    _groups.addAll(groups);
    notifyListeners();
  }
}

