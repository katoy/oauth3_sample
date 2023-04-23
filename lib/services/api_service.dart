import 'dart:convert';
import 'package:http/http.dart' as http;
import '/utils/constants.dart';

class ApiService {
  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('${Constants.API_BASE_URL}$url'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
