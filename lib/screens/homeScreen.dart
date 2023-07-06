import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationButton(
                text: 'Nutzer',
                icon: Icons.person,
                onPressed: () {
                  Navigator.pushNamed(context, '/users');
                },
              ),
              NavigationButton(
                text: 'Gruppen',
                icon: Icons.group,
                onPressed: () {
                  // Aktion für Gruppen-Navigation
                },
              ),
              NavigationButton(
                text: 'Geräte',
                icon: Icons.devices,
                onPressed: () {
                  // Aktion für Geräte-Navigation
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const NavigationButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
    );
  }
}