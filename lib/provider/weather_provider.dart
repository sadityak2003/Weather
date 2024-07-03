
import 'package:flutter/material.dart';

import '../api/api_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic>? _weatherData;
  String _errorMessage = '';
  bool _loading = false;

  Map<String, dynamic>? get weatherData => _weatherData;
  String get errorMessage => _errorMessage;
  bool get loading => _loading;

  Future<void> fetchWeather(String city) async {
    _loading = true;
    notifyListeners();
    try {
      _weatherData = await _weatherService.fetchWeather(city);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
