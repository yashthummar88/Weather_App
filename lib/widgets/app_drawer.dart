import 'package:api_consumer_my_weather/utils/utils.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool expandCity = false;
  bool expandCountry = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(height: 15),
          Text(
            "Choose Location",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.location_city, color: Colors.white),
                  title: Text("Citys",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  trailing: Icon(
                      expandCity ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white),
                  onTap: () {
                    setState(() {
                      expandCity = !expandCity;
                    });
                  },
                ),
                if (expandCity)
                  Column(
                    children: [
                      CityListTile(
                          name: "Mumbai",
                          icon: Icons.location_city,
                          lat: "19.0144",
                          lon: "72.8479"),
                      CityListTile(
                          name: "Delhi",
                          icon: Icons.location_city,
                          lat: "28.6667",
                          lon: "77.2167"),
                      CityListTile(
                          name: "Bangalore",
                          icon: Icons.location_city,
                          lat: "12.9762",
                          lon: "77.6033"),
                      CityListTile(
                          name: "Hyderabad",
                          icon: Icons.location_city,
                          lat: "17.3753",
                          lon: "78.4744"),
                      CityListTile(
                          name: "Ahmedabad",
                          icon: Icons.location_city,
                          lat: "23.0333",
                          lon: "72.6167"),
                      CityListTile(
                          name: "Surat",
                          icon: Icons.location_city,
                          lat: "21.1667",
                          lon: "72.8333"),
                      CityListTile(
                          name: "Chennai",
                          icon: Icons.location_city,
                          lat: "13.0878",
                          lon: "80.2785"),
                    ],
                  ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.public, color: Colors.white),
                  title: Text("Country",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  trailing: Icon(
                      expandCountry ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white),
                  onTap: () {
                    setState(() {
                      expandCountry = !expandCountry;
                    });
                  },
                ),
                if (expandCountry)
                  Column(
                    children: [
                      CityListTile(
                          name: "India",
                          icon: Icons.public,
                          lat: "28.6128",
                          lon: "77.2311"),
                      CityListTile(
                          name: "Netherlands",
                          icon: Icons.public,
                          lat: "52.5",
                          lon: "5.75"),
                      CityListTile(
                          name: "Switzerland",
                          icon: Icons.public,
                          lat: "47.0002",
                          lon: "8.0143"),
                      CityListTile(
                          name: "Canada",
                          icon: Icons.public,
                          lat: "60.1087",
                          lon: "-113.6426"),
                      CityListTile(
                          name: "Germany",
                          icon: Icons.public,
                          lat: "51.5",
                          lon: "10.5"),
                      CityListTile(
                          name: "Japan",
                          icon: Icons.public,
                          lat: "35.6854",
                          lon: "139.7531"),
                      CityListTile(
                          name: "America",
                          icon: Icons.public,
                          lat: "47.5001",
                          lon: "-120.5015"),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
