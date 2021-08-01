import 'package:flutter/material.dart';

class Weather {
  double temp;
  int clouds;
  int humidity;
  double windSpeed;
  int windDeg;
  int visibility;
  int sunrise;
  int sunset;
  String name;
  String country;
  String description;
  double lon;
  int timezone;

  Weather({
    this.temp,
    this.clouds,
    this.visibility,
    this.humidity,
    this.windSpeed,
    this.windDeg,
    this.sunrise,
    this.sunset,
    this.name,
    this.lon,
    this.description,
    this.country,
    this.timezone,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json["main"]["temp"],
      clouds: json["clouds"]["all"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
      country: json["sys"]["country"],
      visibility: json["visibility"],
      humidity: json["main"]["humidity"],
      windDeg: json["wind"]["deg"],
      windSpeed: json["wind"]["speed"],
      name: json["name"],
      description: json["weather"][0]["description"],
      lon: json["coord"]["lon"],
      timezone: json["timezone"],
    );
  }
}
