import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/userScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) =>  HomeScreen(),
        '/users': (context) => const UserScreen(),
      },
    );
  }
}