import 'package:api_consumer_my_weather/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CityListTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final String lat;
  final String lon;

  CityListTile({this.name, this.icon, this.lat, this.lon});

  @override
  _CityListTileState createState() => _CityListTileState();
}

class _CityListTileState extends State<CityListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon, color: Colors.white),
      title: Text(
        widget.name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onTap: () {
        setState(() {
          RemoteService.lat = widget.lat;
          RemoteService.lon = widget.lon;
          Navigator.of(context).pushReplacementNamed("/");
        });
      },
    );
  }
}

SizedBox weatherInfo1({String title, IconData icon, String data, double size}) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FittedBox(
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  size: size,
                ),
              ),
              FittedBox(
                child: Text(
                  data,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    ),
    height: 100,
    width: 100,
  );
}

Column weatherInfo2({String title, String data, IconData icon, double size}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white)),
      SizedBox(height: 5),
      FaIcon(icon, size: size, color: Colors.white),
      SizedBox(height: 5),
      Text(
        data,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
    ],
  );
}

String backImage({AsyncSnapshot snapshot, DateTime time}) {
  int hours = int.parse(DateFormat("HH").format(time).toString());
  int clouds = snapshot.data.clouds;
  double temp = snapshot.data.temp - 273.15;
  print("ss" + hours.toString());
  if ((hours >= 19 && hours <= 23) || (hours >= 0 && hours <= 6)) {
    if (temp <= 0) {
      return "assets/images/snow_night.jpg";
    } else if (clouds >= 70) {
      return "assets/images/rain_night.jpg";
    }
    return "assets/images/night.jpg";
  } else if (hours >= 7 && hours <= 18) {
    if (temp <= 0) {
      return "assets/images/snow_day.jpg";
    } else if (clouds >= 70) {
      return "assets/images/rain_day.jpg";
    }
    return "assets/images/day.jpg";
  }
  return "assets/images/rain.jpg";
}
