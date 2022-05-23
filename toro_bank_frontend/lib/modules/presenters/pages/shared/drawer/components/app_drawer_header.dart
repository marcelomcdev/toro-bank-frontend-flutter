import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/components/bank_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/components/bank_logo.dart';

// ignore: non_constant_identifier_names
Widget AppDrawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/fundo-futuristic.jpg'))),
    child: Stack(
      children: const <Widget>[
        Positioned(
          bottom: 70,
          left: 100,
          child: BankInfo(),
        ),
        BankLogo(),
      ],
    ),
  );
}
