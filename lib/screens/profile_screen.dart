import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translucent_mobile/screens/widgets/buttons_widget.dart';
import 'package:translucent_mobile/utils/requests.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile info",
          style: TextStyle(color: lightBlue),
        ),
        backgroundColor: darkBlue,
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [semiBlue, darkBlue],
                begin: Alignment(-1, -0.5),
                end: Alignment(2, 2)),
            color: semiBlue,
          ),
          child: Column(
            children: [
              TextButton(
                  onPressed: getData,
                  child: Text(
                    "Get Profile Info",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: profileData.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      color: darkBlue,
                      margin: EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          border: Border.all(color: lightBlue, width: 3),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Name:  " + profileData[index],
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Surname:  " + profileData[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.all(15),
                ),
              ),
              myButtons(context)
            ],
          )),
    );
  }

  Future<void> getData() async {
    await httpService.getUserInfoByUsername(loggedUsername);
    resetState();
  }
  void resetState() {
    setState(() {
      // jsonData = jsonDecode(arrangements);
      // locationCity = jsonData['location']['name'];
      // locationCountry = jsonData['location']['country'];
      // localTime = jsonData['location']['localtime'];
      // weather = jsonData['current']['condition']['text'];
      // arrangementId = jsonData['current']['temp_c'].toString();
    });
  }
}
