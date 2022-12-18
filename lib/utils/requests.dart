import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final String baseURL = "http://localhost:9191/";
  String token = "";
//parameters required: username, password
  Future<String> authenticateUser(String username, String password) async {
    String url = baseURL + "users/authenticate";
    var mainUrl = Uri.parse(url);
    var response = await http.post(mainUrl, body: {
      "username":username,
      "password": password
    });
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    token = response.body.toString();
    print('Response body: ${response.body}');

    return token;
  }

  Future<String> getArrangementsForUser(String username) async{
    return "";
  }
}