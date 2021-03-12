import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:skinstonks_mobile/Screens/Home/components/body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.jwt, this.payload);

  factory HomeScreen.fromBase64(String jwt) => HomeScreen(
      jwt, json.decode(ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }
}
