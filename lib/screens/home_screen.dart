
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Weather App')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network("https://lottie.host/179ba13a-3a1b-4302-884b-4f0a7d923b0a/HriKpn6QOT.json"),
                const SizedBox(height: 20),

                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Enter city name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final city = _controller.text;
                      if (city.isNotEmpty) {
                        Provider.of<WeatherProvider>(context, listen: false).fetchWeather(city);
                        Navigator.pushNamed(context, '/weather');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Get Weather', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
