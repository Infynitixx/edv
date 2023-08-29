import 'package:flutter/material.dart';
import 'package:edv/model/group.dart';
import 'package:http/http.dart' as http;

class AddDataPopup<T> extends StatefulWidget {
  final String title;
  final List<String> attributeNames;

  final List<Group> groupList;

  final bool caseSensitive;

  const AddDataPopup({
    required this.title,
    required this.attributeNames,

    required this.groupList,
    this.caseSensitive = false,
  });

  @override
  _AddDataPopupState<T> createState() => _AddDataPopupState<T>();
}

class _AddDataPopupState<T> extends State<AddDataPopup<T>> {
  final List<bool> _groupSelection = [];

  @override
  void initState() {
    super.initState();
    _groupSelection.addAll(List.filled(widget.groupList.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Standard-Textfelder hier einfügen
          for (var attributeName in widget.attributeNames)
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: attributeName,
                ),
              ),
            ),
          if (widget.caseSensitive)
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Gruppenzugehörigkeit:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          if (widget.caseSensitive)
          // Checkboxen für jede Gruppe hinzufügen
            for (var i = 0; i < widget.groupList.length; i++)
              ListTile(
                leading: Checkbox(
                  value: _groupSelection[i],
                  onChanged: (bool? value) {
                    setState(() {
                      _groupSelection[i] = value ?? false;
                    });
                  },
                ),
                title: Text(widget.groupList[i].grpBez),
              ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Abbrechen'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Hinzufügen'),
          onPressed: () {
            http.post(Uri.parse('https://025b-84-60-244-29.ngrok-free.app/api/user'),

            body:{"id":1.toString(), "name":"Infintitxx"});
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}