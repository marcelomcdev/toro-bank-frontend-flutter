// ignore_for_file: unused_element, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toro_bank_frontend/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  void _onItemTapped(int index, context) {
    switch (index) {
      case 0:
        Modular.to.pushNamed('/');
        break;
      case 1:
        Modular.to.pushNamed('mostnegotiated');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_sharp),
            label: 'Ativos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), label: 'Perfil'),
      ],
      selectedItemColor: kToroTextColor,
    );
  }
}
