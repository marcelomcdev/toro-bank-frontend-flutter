import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/components/bank_info.dart';

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
      children: <Widget>[
        const Positioned(bottom: 70, left: 100, child: BankInfo()),
        Positioned(
          bottom: 65.0,
          left: 68.0,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/toro.png'),
            ),
          ),
        ),
      ],
    ),
  );
}
