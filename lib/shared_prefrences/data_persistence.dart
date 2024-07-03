
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider with ChangeNotifier {
  // ...existing code...

  Future<void> saveCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCity', city);
  }

  Future<String?> loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastCity');
  }

  @override
  Future<void> fetchWeather(String city) async {
    // ...existing code...
    await saveCity(city);
  }
}
