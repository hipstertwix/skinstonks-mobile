import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinstonks_mobile/config/constants.dart';
import 'package:skinstonks_mobile/routes/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skinstonks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      initialRoute: '/',
      onGenerateRoute: routes,
    );
  }
}
