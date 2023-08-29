import 'package:flutter/material.dart';
import 'package:edv/screens/userViewModel.dart';
import 'package:edv/model/user.dart';
import 'package:edv/ui/listItem.dart';
import 'package:edv/ui/detailRow.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserViewModel _userViewModel;


  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _userViewModel = UserViewModel();
    _userViewModel.addListener(_onUserViewModelChanged);
    _userViewModel.loadUsers();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _userViewModel.removeListener(_onUserViewModelChanged);
    _searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onUserViewModelChanged() {
    setState(() {});
  }


  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _userViewModel.users.where((user) =>
    user.vorname.toLowerCase().contains(_searchTerm.toLowerCase()) ||
        user.nachname.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();


    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: Text('Nutzer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListItem(
                  title: filteredUsers[index].vorname,
                  subtitle: filteredUsers[index].nachname,
                  titleSize: 16,
                  subtitleSize: 16,
                  onTap: () => _showUserDetails(filteredUsers[index]),
                );
              },
              itemCount: filteredUsers.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 96, bottom: 16),
            child: Container(

              child: TextField(
                controller: _searchController,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/users/create',);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showUserDetails(User user) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          Container(
            color: Color(0xFF424242),
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailRow.buildDataRow('Vorname:', user.vorname),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Nachname:', user.nachname),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Anmeldename:', user.anmeldename),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Status:', '${user.status}'),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Gruppenzugehörigkeit:', user.adGruppen),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Verwendung:', user.verwendung),
                DetailRow.buildSeparator(),
                DetailRow.buildDataRow('Adresse:', user.adresse),
              ],
            ),
          ),
    );
  }
}