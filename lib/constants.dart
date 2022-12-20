import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translucent_mobile/utils/Arrangement.dart';
import 'package:translucent_mobile/utils/user.dart';

const semiBlue = Color.fromRGBO(143, 167, 196, 1);
const lightBlue = Color.fromRGBO(210, 236, 249, 1);
const lightGray = Color.fromRGBO(216, 220, 220, 1);
const darkBlue = Color.fromRGBO(36, 60, 108, 1);

final logo =
    Image.asset("assets/translucent_logo.png", width: 180, height: 180);
Image mainGif = Image.asset("assets/kiss.gif", height: 10, width: 10);
final pref = getSharedPreferences();
String userToken = "";
String loggedUsername = "";
String userId = "";
List<String> dates = [];
User profileData = User("", "", "", loggedUsername);
List<Arrangement> arrangementList = [];

Map<String, dynamic> jsonData = {
  "location": 'info',
  "condition": 'condition info'
};
Map<String, dynamic> arrangementsJsonData = {
  "arrangements": "",
};

getSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

const kLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [darkBlue, lightBlue],
);
