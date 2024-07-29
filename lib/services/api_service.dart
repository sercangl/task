import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'd9b344edbd514be69f0dd7150c3b2e89';
  static const String baseUrl = 'https://api.rawg.io/api';

  Future<List<dynamic>> fetchGames(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/games?key=$apiKey&search=$query'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load games');
    }
  }
}
