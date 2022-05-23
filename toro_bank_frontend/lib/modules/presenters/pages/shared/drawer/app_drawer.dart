import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          AppDrawerItem(
            icon: Icons.whatshot,
            text: 'Ativos mais negociados',
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/mostnegotiated'),
          ),
          const Divider(),
          AppDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Sair',
            onTap: () => {
              Future.delayed(const Duration(seconds: 0), () async {
                var prefs = await SharedPreferences.getInstance();

                if (prefs.getInt("userId") > 0) {
                  await prefs.remove("userId");
                }

                if (prefs.getString("token") != "") {
                  await prefs.remove("token");
                }
              }),
              Navigator.pushReplacementNamed(context, '/')
            },
          ),
        ],
      ),
    );
  }
}
