import 'package:flutter/material.dart';
import 'package:edv/screens/groupViewModel.dart';
import 'package:edv/ui/listItem.dart';



class UserCreateScreen extends StatefulWidget {
  const UserCreateScreen({Key? key}) : super(key: key);

  @override
  State<UserCreateScreen> createState() => _UserCreateScreenState();
}

class SelectedGroup{
  final int grpId;
  final String grpBez;

  SelectedGroup({required this.grpId, required this.grpBez});
}


class _UserCreateScreenState extends State<UserCreateScreen> {
  late final GroupViewModel _groupViewModel;

  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _loginnameController = TextEditingController();
  TextEditingController _adressController = TextEditingController();
  TextEditingController _commentController = TextEditingController();

  List<int> selectedGroupIds = [];

  void _addGroupId(int groupId) {
    if (!selectedGroupIds.contains(groupId)) {
      setState(() {
        selectedGroupIds.add(groupId);
      });
    }
  }

  void _removeGroupId(int groupId) {
    setState(() {
      selectedGroupIds.remove(groupId);
    });
  }



  @override
  void initState() {
    super.initState();

    _groupViewModel = GroupViewModel();
    _groupViewModel.addListener(_onGroupViewModelChanged);
    _groupViewModel.loadGroups();
    _searchController.addListener(_onSearchChanged);

  }
  @override
  void dispose() {

    _groupViewModel.removeListener(_onGroupViewModelChanged);
    _searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onGroupViewModelChanged() {
    setState(() {});
  }
  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredGroups = _groupViewModel.groups.where((group) =>
        group.grpBez.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Color(0xFF212121),
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Stammdaten'),
                  Tab(text: 'Gruppen'),
                ],
              ),
            ),
            body: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Vorname'),
                          ),
                          SizedBox(height: 16.0),
                          TextField(
                            controller: _surnameController,
                            decoration: InputDecoration(labelText: 'Nachname'),
                          ),
                          SizedBox(height: 16.0),
                          TextField(
                            controller: _loginnameController,
                            decoration: InputDecoration(labelText: 'Anmeldename'),
                          ),
                          SizedBox(height: 16.0),
                          TextField(
                            controller: _adressController,
                            decoration: InputDecoration(labelText: 'E-Mail Adresse'),
                          ),
                          SizedBox(height: 16.0),
                          TextField(
                            controller: _commentController,
                            maxLines: 10,
                            decoration: InputDecoration(labelText: 'Verwendung'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                      children: [
                        Wrap(
                          spacing: 8.0,
                          children: selectedGroupIds.map((groupId) {
                            final SelectedGroup = filteredGroups.firstWhere((SelectedGroup) => SelectedGroup.grpId == groupId);
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      SelectedGroup.grpBez,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(width: 4.0),
                                    GestureDetector(
                                      onTap: () {
                                        _removeGroupId(groupId);
                                      },
                                      child: Icon(Icons.close, size: 12),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return ListItem(
                                  title: filteredGroups[index].grpBez,
                                  subtitle: filteredGroups[index].grpTypBez,
                                  titleSize: 14,
                                  subtitleSize: 10,
                                  onTap: () {
                                    _addGroupId(filteredGroups[index].grpId);
                                  },
                              );
                            },
                            itemCount: filteredGroups.length,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 96, bottom: 16),
                          child: Container(

                            height: 60.0,
                            child: TextField(
                              controller: _searchController,
                            ),
                          ),
                        ),
                      ]
                  ),
                ]
            ),
            floatingActionButton: FloatingActionButton(
            onPressed: () {
          Navigator.pushNamed(context, '/users/create',);
          },
      child: Icon(Icons.send),
    ),
        )
    );
  }
  }
