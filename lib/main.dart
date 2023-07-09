import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/userScreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {

  httpServer();

  runApp(const MyApp());

}

void httpServer() async {
  final server = await HttpServer.bind('localhost', 8080);

  print('Server gestartet: ${server.address.address}:${server.port}');

  await for (var request in server) {
    if (request.method == 'POST') {
      var body = await request.transform(utf8.decoder).join();
      var data = json.decode(body);

      print('Empfangene Daten: $data');

      // Hier kannst du weitere Überprüfungen oder Verarbeitungen durchführen

      request.response.statusCode = 200;
      request.response.close();
    }
  }
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

