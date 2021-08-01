import 'package:api_consumer_my_weather/models/weather.dart';
import 'package:api_consumer_my_weather/services/remote_service.dart';
import 'package:api_consumer_my_weather/widgets/app_drawer.dart';
import 'package:api_consumer_my_weather/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  RemoteService remoteService = RemoteService();
  Future<Weather> fetchWeather;
  void initState() {
    fetchWeather = remoteService.fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.black.withOpacity(0.5)),
          child: Drawer(
            child: AppDrawer(),
          ),
        ),
        body: FutureBuilder(
          future: fetchWeather,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong....!!!!!!!"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: WeatherWidget(
                snapshot: snapshot,
              ),
            );
          },
        ),
      ),
    );
  }
}
