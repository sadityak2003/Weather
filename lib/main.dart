import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapi/provider/weather_provider.dart';
import 'package:weatherapi/screens/home_screen.dart';
import 'package:weatherapi/screens/weather_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final lastCity = prefs.getString('lastCity');
  runApp(MyApp(lastCity: lastCity));
}

class MyApp extends StatelessWidget {
  final String? lastCity;
  MyApp({this.lastCity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = WeatherProvider();
        if (lastCity != null) {
          provider.fetchWeather(lastCity!);
        }
        return provider;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/weather': (context) => WeatherDetailsScreen(),
        },
      ),
    );
  }
}

