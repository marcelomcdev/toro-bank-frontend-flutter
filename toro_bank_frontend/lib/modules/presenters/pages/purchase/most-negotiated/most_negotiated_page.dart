import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/components/body.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/drawer/app_drawer.dart';

class MostNegotiatedAssetPage extends StatelessWidget {
  const MostNegotiatedAssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: kToroHeaderColor,
        title: const Text('Ativos mais negociados'),
      ),
      body: const Body(),
    );
  }
}
