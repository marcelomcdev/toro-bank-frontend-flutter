import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/app_drawer_header.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/app_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          AppDrawerHeader(),
          AppDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          AppDrawerItem(
            icon: Icons.whatshot,
            text: 'Ativos mais negociados',
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/mostnegotiated'),
          ),
          const Divider(),
          AppDrawerItem(icon: Icons.account_box_rounded, text: 'Perfil'),
          AppDrawerItem(icon: Icons.bug_report, text: 'Reportar problema'),
        ],
      ),
    );
  }
}
