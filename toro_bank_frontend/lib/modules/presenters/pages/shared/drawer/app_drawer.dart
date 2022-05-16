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
          // createDrawerItem(
          //   icon: Icons.calculate,
          //   text: 'Calculadora',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, Routes.listaItens),
          // ),
          AppDrawerItem(
            icon: Icons.whatshot,
            text: 'Ativos mais negociados',
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/mostnegotiated'),
          ),
          // AppDrawerItem(
          //   icon: Icons.whatshot,
          //   text: 'Sagrado Coração de Jesus',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, Routes.sagradoCoracao),
          // ),
          // AppDrawerItem(
          //   icon: Icons.wysiwyg_outlined,
          //   text: 'As 15 Orações de Santa Brígida',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, Routes.quinzeOracoes),
          // ),
          // AppDrawerItem(
          //   icon: Icons.wysiwyg_outlined,
          //   text: 'As 15 Orações de Santa Brígida - II',
          //   onTap: () => Navigator.pushReplacementNamed(
          //       context, Routes.quinzeOracoesSantaBrigida),
          // ),
          // AppDrawerItem(
          //   icon: Icons.hail,
          //   text: 'Santo Rosário',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, Routes.santoRosario),
          // ),
          // const Divider(),
          // AppDrawerItem(
          //   icon: Icons.receipt_sharp,
          //   text: 'Catecismo da Igreja Católica',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, Routes.catecismo),
          // ),
          // AppDrawerItem(
          //   icon: Icons.note,
          //   text: 'Notes',
          //   onTap: () => Navigator.pushReplacementNamed(context, Routes.notes),
          // ),
          // const Divider(),
          // AppDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
          // AppDrawerItem(icon: Icons.face, text: 'Authors'),
          // AppDrawerItem(
          //     icon: Icons.account_box, text: 'Flutter Documentation'),
          // AppDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          const Divider(),
          AppDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          // ListTile(
          //   title: const Text('Versão 0.0.1.0505'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
