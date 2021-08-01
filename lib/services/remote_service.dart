import 'dart:convert';
import 'package:api_consumer_my_weather/models/weather.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static String lat = "44.4687";
  static String lon = "-71.1851";
  Future<Weather> fetchWeather() async {
    http.Response res = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=146c41512f4d01b20fc73b673c804796"));
    if (res.statusCode == 200) {
      return Weather.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Something went wrong !!!!");
    }
  }
}
