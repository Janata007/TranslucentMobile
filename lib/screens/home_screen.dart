import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translucent_mobile/screens/widgets/custom_button.dart';

import '../constants.dart';
import '../utils/requests.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.city});

  final String city;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String arrangements="";
  final TextEditingController _arrangementTextController =
      TextEditingController();
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              "Return to main ->",
              style: TextStyle(fontSize: 17, color: lightGray),
            )
          ],
        ),
        backgroundColor: darkBlue,
        actions: [
          IconButton(
              onPressed: () {
                redirectToHome();
              },
              icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(color: Colors.white, width: 4),
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newCity,
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("CITY: " + locationCity,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("COUNTRY: " + locationCountry,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("LOCAL DATE AND TIME: " + localTime,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("CURRENT WEATHER: " + weather,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("TEMPERATURE: " + tempC,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: getData,
                  child: Text(
                    "get weather data",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: getForecast,
                  child: Text(
                    "get forecast data for this city",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              myButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getArrangementsForUser() async {
    arrangements = await httpService.getCurrentWeatherByCity(widget.city);
    resetState();
  }

  Future<void> getForecast() async {
    arrangements = await httpService.getArrangementsForUser(loggedUsername);
    setArrangementsInfo();
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForecastScreen()));
  }

  void setArrangementsInfo() {
    dates.clear();
    arrangementsJsonData = jsonDecode(arrangements);
    List<dynamic> days = forecastJsonData["forecast"]["forecastday"];
    //todo: map dates correctly based on json
    Map<String, dynamic> day1 = days[0];
    Map<String, dynamic> day2 = days[1];
    Map<String, dynamic> day3 = days[2];
    daysDates.add(day1["date"]);
    daysDates.add(day2["date"]);
    daysDates.add(day3["date"]);

    day1Temp = day1["day"]['avgtemp_c'];
    day2Temp = day2["day"]['avgtemp_c'];
    day3Temp = day3["day"]['avgtemp_c'];
    daysTemp.add(day1Temp.toString());
    daysTemp.add(day2Temp.toString());
    daysTemp.add(day3Temp.toString());
  }

  void resetState() {
    setState(() {
      jsonData = jsonDecode(arrangements);
      locationCity = jsonData['location']['name'];
      locationCountry = jsonData['location']['country'];
      localTime = jsonData['location']['localtime'];
      weather = jsonData['current']['condition']['text'];
      tempC = jsonData['current']['temp_c'].toString();
    });
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(weatherData: mainWeatherData)));
  }
}
