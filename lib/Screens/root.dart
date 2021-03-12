import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skinstonks_mobile/Screens/Home/home_screen.dart';
import 'package:skinstonks_mobile/Screens/Welcome/welcome_screen.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwtToken");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: jwtOrEmpty,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        if (snapshot.data != "") {
          var str = snapshot.data.toString();
          var jwt = str.split(".");

          if (jwt.length != 3) {
            return WelcomeScreen();
          } else {
            var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
            if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                .isAfter(DateTime.now())) {
              return HomeScreen(str, payload);
            } else {
              return WelcomeScreen();
            }
          }
        } else {
          return WelcomeScreen();
        }
      },
    );
  }
}
