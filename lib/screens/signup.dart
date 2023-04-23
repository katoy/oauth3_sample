import 'package:flutter/material.dart';
import '/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
            ElevatedButton(
              onPressed: () async {
                await _authService.signUpWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text('Sign up with Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _authService.signUpWithGithub();
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/github_logo.png', width: 24, height: 32),
                  SizedBox(width: 8),
                  Text('Sign up with GitHub'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
