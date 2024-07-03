import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = 'a9a423863e0e4c2599332900240207';
  static const String _baseUrl = 'http://api.weatherapi.com/v1/current.json?key=a9a423863e0e4c2599332900240207&q=India';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl?q=$city&units=metric&appid=$_apiKey'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
