import 'package:flutter/material.dart';

/* Colors */
const kPrimaryColor = Color(0xFF5B63C6);
const kPrimaryLightColor = Color(0xFFBDBDEF);
const kPrimaryDarkColor = Color(0xFF434682);
const kPrimaryHeadingColor = Color(0xFF282828);

const kScaffoldBackgroundColor = Color(0xFFE5E6F5);

const kLinearGradientLightColor = Color(0xFF7478D6);
const kLinearGradientDarkColor = Color(0xFF595EC1);

const kWhite = Color(0xFFF8F8F8);

/* Other */
const kSidePadding = 30.00;
const kTopPadding = 35.00;

LinearGradient kLinearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [kLinearGradientLightColor, kLinearGradientDarkColor],
);

BoxShadow kBoxShadow =
    BoxShadow(color: kPrimaryColor.withOpacity(0.2), offset: Offset(0, 20.0), blurRadius: 20.0);
