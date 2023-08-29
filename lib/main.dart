import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/userScreenMain.dart';
import 'screens/userScreenCreate.dart';
import 'screens/settingScreen.dart';

import 'data/auth.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  void checkToken() async {
    var authorization = Authorization();
    isLoggedIn = await authorization.checkToken();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Altratec-EDV',
      theme: ThemeData(
        brightness: Brightness.dark,


        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0)
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.black26)
            )
        ),


      ),

      initialRoute: isLoggedIn ? '/' : '/login',
      routes: {
        '/': (context) => isLoggedIn ? HomeScreen() : LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/users': (context) => const UserScreen(),
        '/users/new': (context) => const UserScreen(),
        '/users/edit': (context) => const UserScreen(),
        '/users/create': (context) => const UserCreateScreen(),
        '/settings': (context) =>  ConfigScreen(),
      },
    );
  }

}