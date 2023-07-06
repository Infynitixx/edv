import 'package:flutter/material.dart';
import 'package:edv/screens/userViewModel.dart';
import 'package:edv/model/user.dart';
import 'package:edv/ui/listItem.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserViewModel _viewModel;
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _viewModel = UserViewModel();
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.loadUsers();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _viewModel.users.where((user) =>
    user.vorname.toLowerCase().contains(_searchTerm.toLowerCase()) ||
        user.nachname.toLowerCase().contains(_searchTerm.toLowerCase())).toList();

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
                return ListItem( // Verwende die ListItem Klasse
                  title: 'Titel $index',
                  subtitle: 'Untertitel $index',
                  onTap: () => print('Item $index tapped'),
                );
              },
              itemCount: filteredUsers.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF424242),
            child:
            TextField(
              controller:
              _searchController,
              decoration:
              InputDecoration(
                hintText:
                'Suche...',
                fillColor:
                Colors.white,
                filled:
                true,
                border:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(24),
                  borderSide:
                  BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showUserDetails(User user) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          Container(
            color: Color(0xFF424242),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(child:
                  Text('Vorname:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.vorname, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Nachname:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.nachname, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Anmeldename:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.anmeldename, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Status:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text('${user.status}', style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Gruppenzugehörigkeit:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.adGruppen, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Verwendung:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.verwendung, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(child:
                  Text('Adresse:', style:
                  TextStyle(fontSize: 14, color: Colors.white))),
                  Expanded(child:
                  Text(user.adresse, style:
                  TextStyle(fontSize: 18, color: Colors.white))),
                ]),
              ],
            ),
          ),
    );
  }
}