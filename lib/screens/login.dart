import 'package:flutter/material.dart';
import '/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _authService.signInWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text('Login with Email'),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: Text('Sign up'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement GitHub login here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/github_logo.png', width: 32),
                  SizedBox(width: 10.0),
                  Text('Login with GitHub'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
