import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:skinstonks_mobile/screens/home/index.dart';
import 'package:skinstonks_mobile/screens/welcome/index.dart';
import 'package:skinstonks_mobile/services/auth.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<String> get checkToken async {
    //await storage.deleteAll();
    var jwt = await storage.read(key: "jwtToken");
    if (jwt == null) return "";
    var jwtSplit = jwt.split(".");

    if (jwtSplit.length == 3) {
      var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwtSplit[1]))));
      if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000).isAfter(DateTime.now())) {
        return jwt;
      } else {
        String? refreshToken = await storage.read(key: "refreshToken");
        final response = await AuthService.refreshToken(refreshToken!);
        if (response is Response && response.statusCode == 200) {
          final resBody = json.decode(response.body);
          await storage.write(key: "jwtToken", value: resBody['jwtToken']);
          await storage.write(key: "refreshToken", value: resBody['refreshToken']);
          print('Tokens were refreshed and you were logged back in.');
          return resBody['jwtToken'];
        }
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkToken,
      builder: (context, snapshot) {
        // TODO: Add a loading screen here.
        if (!snapshot.hasData) return CircularProgressIndicator();
        if (snapshot.data != "") {
          var jwt = snapshot.data.toString();
          return HomeScreen.fromBase64(jwt);
        } else {
          return WelcomeScreen();
        }
      },
    );
  }
}
