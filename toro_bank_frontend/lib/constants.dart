import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/size_config.dart';

const kPrimaryColor = Color(0xFF4D1892);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF862AFF), Color(0xFF4D1892)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

//colors of toro app
const kToroTextColor = Color(0xFF4D1892);
const kToroBlackColor = Color.fromARGB(255, 32, 32, 32);
const kToroHeaderColor = Color(0xDF05103B);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
