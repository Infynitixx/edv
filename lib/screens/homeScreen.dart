import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
              },
          ),
        ],
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

                icon: Icons.person,
                onPressed: () {
                  Navigator.pushNamed(context, '/users');
                },
              ),
              NavigationButton(

                icon: Icons.group,
                onPressed: () {
                  // Aktion für Gruppen-Navigation
                },
              ),
              NavigationButton(

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

  final IconData icon;
  final VoidCallback onPressed;

  const NavigationButton({

    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 40),


    );
  }



}

