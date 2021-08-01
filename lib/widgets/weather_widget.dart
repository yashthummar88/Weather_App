import 'package:api_consumer_my_weather/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  WeatherWidget({this.snapshot});

  DateTime timezone({int time}) {
    final temp = DateTime.now()
        .add(Duration(seconds: time - DateTime.now().timeZoneOffset.inSeconds));
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: AssetImage(backImage(
            snapshot: snapshot, time: timezone(time: snapshot.data.timezone))),
      )),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.060,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${snapshot.data.name.toUpperCase()} (${snapshot.data.country.toUpperCase()})",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(Icons.location_on, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode, size: 70, color: Colors.white),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("dd MMMM")
                          .format(timezone(time: snapshot.data.timezone))
                          .toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      DateFormat("EEEE")
                          .format(timezone(time: snapshot.data.timezone))
                          .toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      DateFormat("hh:mm a")
                          .format(timezone(time: snapshot.data.timezone))
                          .toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.080,
            child: Text(
              "${(snapshot.data.temp - 273.15).toStringAsFixed(2)}°",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
            child: Text(
              snapshot.data.description,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.29, //230,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    weatherInfo1(
                        icon: FontAwesomeIcons.thermometerThreeQuarters,
                        title: "Temperature",
                        data:
                            "${(snapshot.data.temp - 273.15).toStringAsFixed(2)}°C",
                        size: 35),
                    weatherInfo1(
                        icon: FontAwesomeIcons.cloud,
                        title: "      Clouds",
                        data: "${(snapshot.data.clouds).toStringAsFixed(0)}",
                        size: 35),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    weatherInfo1(
                        icon: FontAwesomeIcons.wind,
                        title: "Wind Speed",
                        data:
                            "${(snapshot.data.windSpeed).toStringAsFixed(1)}km/h",
                        size: 35),
                    weatherInfo1(
                        icon: FontAwesomeIcons.caretSquareUp,
                        title: "Wind Degree",
                        data: "  ${(snapshot.data.windDeg).toStringAsFixed(0)}",
                        size: 35),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.060,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 100,
                    child: Divider(
                      height: 10,
                      color: Colors.white,
                    )),
                Text(
                  "More Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                    width: 100,
                    child: Divider(height: 10, color: Colors.white)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height * 0.18, //120,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                weatherInfo2(
                    title: "Humidity",
                    icon: FontAwesomeIcons.tint,
                    size: 30,
                    data: " ${(snapshot.data.humidity).toStringAsFixed(0)}%"),
                SizedBox(width: 50),
                weatherInfo2(
                    title: "Visibility",
                    icon: FontAwesomeIcons.solidEye,
                    size: 30,
                    data: " ${(snapshot.data.visibility).toStringAsFixed(0)}"),
                SizedBox(width: 50),
                weatherInfo2(
                    title: "Sunrise",
                    icon: FontAwesomeIcons.cloudSun,
                    size: 30,
                    data:
                        " ${DateFormat("hh:mm").format(timezone(time: snapshot.data.sunrise))}"),
                SizedBox(width: 50),
                weatherInfo2(
                    title: "Sunset",
                    icon: FontAwesomeIcons.cloudMoon,
                    size: 30,
                    data:
                        " ${DateFormat("hh:mm").format(timezone(time: snapshot.data.sunset))}"),
                SizedBox(width: 50),
                weatherInfo2(
                    title: "Longitude",
                    icon: FontAwesomeIcons.globe,
                    size: 30,
                    data: " ${(snapshot.data.lon).toStringAsFixed(2)}"),
                SizedBox(width: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
