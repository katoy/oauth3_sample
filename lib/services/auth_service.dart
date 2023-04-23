import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/services/api_service.dart';
import '/utils/constants.dart';

class AuthService {
  final ApiService _apiService = ApiService();

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _apiService.post('/signup', {
      'email': email,
      'password': password,
    });
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _apiService.post('/login', {
      'email': email,
      'password': password,
    });
  }

  Future<void> signUpWithGithub() async {
    final String clientId = dotenv.env['GITHUB_CLIENT_ID']!;
    final String clientSecret = dotenv.env['GITHUB_CLIENT_SECRET']!;

    if (clientId.isEmpty || clientSecret.isEmpty) {
      throw Exception(
          'GitHub Client ID and/or Client Secret not found in .env file');
    }

    await _apiService.post('/signup/github', {
      'client_id': clientId,
      'client_secret': clientSecret,
    });
  }

  Future<void> signOut() async {
    await _apiService.post('/logout', {});
  }
}
