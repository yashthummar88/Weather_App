import 'package:api_consumer_my_weather/models/weather.dart';
import 'package:api_consumer_my_weather/screens/weather_screen.dart';
import 'package:api_consumer_my_weather/services/remote_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => WeatherScreen(),
    },
  ));
}
