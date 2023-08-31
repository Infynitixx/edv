import 'package:flutter/material.dart';
import 'package:edv/data/auth.dart';
import 'package:edv/screens/loginViewModel.dart';
import 'package:edv/model/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _urlController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
    _loginViewModel.addListener(_onLoginViewModelChanged);
    _loginViewModel.labelText;
  }

  @override
  void dispose() {
    _loginViewModel.removeListener(_onLoginViewModelChanged);
    super.dispose();
  }

  void _onLoginViewModelChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'URL', hintText: 'URL eingeben'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async{
                int status = await onLoginButtonClicked();
                if (status == 0){
                  loginError("Falsche Anmelededaten!");
                }
              },
              child: Text('URL eintragen'),
            ),
            FutureBuilder<String>(
              future: _loginViewModel.labelText,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(snapshot.data ?? '');
                }
              },
            ),
            SizedBox(height: 32.0),



            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'E-Mail'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async{
                int status = await onLoginButtonClicked();
                if (status == 0){
                  loginError("Falsche Anmelededaten!");
                }
              },
              child: Text('Anmelden'),
            ),
          ],
        ),
      ),
    );
  }

  onLoginButtonClicked() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    Login login = Login(username: username, password: password);
    Authorization authorization = Authorization();
    int status = await authorization.CheckLogin(login);
    if (status == 1) {
      Navigator.pushNamed(context, '/home');
    }
    else {
      return status;
    }
  }

  void loginError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fehler'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}



