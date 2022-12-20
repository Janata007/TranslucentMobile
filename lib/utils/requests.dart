import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translucent_mobile/constants.dart';

class HttpService {
  final String baseURL = "http://10.0.2.2:9002/";

//parameters required: username, password
  Future<String> authenticateUser(String username, String password) async {
    loggedUsername = username;
    String url = baseURL + "users/authenticate";
    var mainUrl = Uri.parse(url);
    var response = await http.post(
      mainUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
    Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    userToken = decodedResponse.values.first.toString();
    return userToken;
  }

  Future<void> getUserInfoByUsername(String username) async {
    String url = baseURL + "user?username=" + loggedUsername;
    var mainUrl = Uri.parse(url);
    var response = await http.get(mainUrl,
    headers: <String,String>{
      'Authorization':'Bearer ' + userToken
    });
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print("RESPONSE:" + decodedResponse.toString());
    //todo: extract profile data
  }

  Future<String> getArrangementsForUser(String username) async {
    return "";
  }
}
