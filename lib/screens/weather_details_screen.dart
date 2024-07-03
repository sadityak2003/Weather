import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Weather Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              final weatherProvider =
                  Provider.of<WeatherProvider>(context, listen: false);
              weatherProvider.fetchWeather(
                  weatherProvider.weatherData!['location']['name']);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              if (weatherProvider.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (weatherProvider.errorMessage.isNotEmpty) {
                return Center(child: Text(weatherProvider.errorMessage));
              } else if (weatherProvider.weatherData != null) {
                final weatherData = weatherProvider.weatherData!;
                final location = weatherData['location'];
                final current = weatherData['current'];
                final condition = current['condition'];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('City: ${location['name']}',
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
                      const SizedBox(height: 25),

                      // Weather Image Condition Card
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 30,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Image.network('https:${condition['icon']}',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Temperature & Condition Cards
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Temperature Card
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 30,
                            shadowColor: Colors.grey.shade700,
                            child: Container(
                              width: 150,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Temperature',
                                        style: TextStyle(color: Colors.white)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //const Icon(FontAwesomeIcons.temperatureHalf, color: Colors.white, size: 30),
                                        Container(
                                          width: 35,
                                          height: 40,
                                          child: Lottie.network(
                                              "https://lottie.host/5fbacf2c-0f45-4640-9e9a-93f4ab532543/IiYMkeqj9X.json"),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(' ${current['temp_c']}°C',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Condition Card
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 30,
                            shadowColor: Colors.grey.shade700,
                            child: Container(
                              width: 150,
                              height: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Condition',
                                        style: TextStyle(color: Colors.white)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //const Icon(Icons.foggy, color: Colors.white, size: 30),
                                        Container(
                                          width: 35,
                                          height: 40,
                                          child: Lottie.network(
                                              "https://lottie.host/ce5324a1-653e-4449-89ac-7ca5f740ac9e/VfzVXoYJVa.json"),
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            '${condition['text']}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Humidity & Wind Speed Cards
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 30,
                            shadowColor: Colors.grey.shade700,
                            child: Container(
                              width: 150,
                              height: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Humidity',
                                        style: TextStyle(color: Colors.white)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //const Icon(Icons.air_rounded, color: Colors.white, size: 30),
                                        Container(
                                          width: 35,
                                          height: 40,
                                          child: Lottie.network(
                                              "https://lottie.host/1cdc6705-60e4-4322-bd0f-a4b824510131/oXsIfRjjBj.json"),
                                        ),
                                        const SizedBox(width: 10),
                                        Text('${current['humidity']}%',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 30,
                            shadowColor: Colors.grey.shade700,
                            child: Container(
                              width: 150,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Wind Speed',
                                        style: TextStyle(color: Colors.white)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //const Icon(Icons.speed_rounded, color: Colors.white, size: 30),
                                        Container(
                                          width: 35,
                                          height: 40,
                                          child: Lottie.network(
                                              "https://lottie.host/fb574918-5d1e-44f5-b1d3-e3f2baa772d9/4dyixKMI15.json"),
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                            child: Text(
                                                '${current['wind_kph']} kph',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 1)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('No data'));
              }
            },
          ),
        ),
      ),
    );
  }
}

/*
                  Text('City: ${location['name']}', style: const TextStyle(fontSize: 24)),
                  Text('Temperature: ${current['temp_c']}°C', style: const TextStyle(fontSize: 24)),
                  Text('Condition: ${condition['text']}', style: const TextStyle(fontSize: 24)),
                  Image.network('https:${condition['icon']}'),
                  Text('Humidity: ${current['humidity']}%', style: const TextStyle(fontSize: 24)),
                  Text('Wind Speed: ${current['wind_kph']} kph', style: const TextStyle(fontSize: 24)),
 */
