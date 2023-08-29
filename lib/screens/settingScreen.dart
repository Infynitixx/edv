import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _pathController = TextEditingController();

  String _savedIp = '';
  String _savedPath = '';

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedIp = prefs.getString('ip') ?? '';
      _savedPath = prefs.getString('path') ?? '';
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ip', _ipController.text);
    prefs.setString('path', _pathController.text);
    _loadSavedData(); // Update the displayed values after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfiguration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingField('IP zum Server', _ipController, _savedIp),
            SizedBox(height: 20),
            _buildSettingField('Pfad zu Rechnungen', _pathController, _savedPath),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingField(
    String label,
    TextEditingController controller,
    String savedValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: savedValue,
          ),
        ),
      ],
    );
  }
}