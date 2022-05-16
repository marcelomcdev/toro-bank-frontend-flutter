import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';

// ignore: non_constant_identifier_names
Widget AppDrawerItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(children: <Widget>[
      Icon(
        icon,
        color: kToroTextColor,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          text!,
          style: const TextStyle(
            color: kToroTextColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ]),
    onTap: onTap,
  );
}
