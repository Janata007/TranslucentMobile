import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const semiBlue = Color.fromRGBO(143, 167, 196, 1);
const lightBlue = Color.fromRGBO(210, 236, 249, 1);
const lightGray = Color.fromRGBO(216, 220, 220, 1);
const darkBlue = Color.fromRGBO(36, 60, 108, 1);

final logo = Image.asset("assets/logo_nogb.png", width: 180, height: 180);
Image mainGif = Image.asset("assets/kiss.gif", height: 10, width: 10);
final pref = getSharedPreferences();
String userToken = "";
String loggedUsername = "";
int userId = 0;
List<String> dates = [];
String profileData = "";
String arrangementData = "";

Map<String, dynamic> jsonData = {
  "location": 'info',
  "condition": 'condition info'
};
Map<String, dynamic> arrangementsJsonData = {
  "forecast": "",
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