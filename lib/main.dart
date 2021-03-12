import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinstonks_mobile/Screens/root.dart';
import 'package:skinstonks_mobile/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skinstonks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      home: Root(),
    );
  }
}
