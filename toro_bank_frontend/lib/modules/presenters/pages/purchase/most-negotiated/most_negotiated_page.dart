import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/components/body.dart';

class MostNegotiatedAssetPage extends StatelessWidget {
  const MostNegotiatedAssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kToroHeaderColor,
        title: const Text('Ativos mais negociados'),
      ),
      body: const Body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_sharp),
              label: 'Ativos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Perfil'),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: kToroTextColor,
      ),
    );
  }
}


// class MostNegotiatedAssetsPage extends StatefulWidget {
//   const MostNegotiatedAssetsPage({Key? key}) : super(key: key);

//   @override
//   State<MostNegotiatedAssetsPage> createState() =>
//       _MostNegotiatedAssetsPageState();
// }

// class _MostNegotiatedAssetsPageState extends State<MostNegotiatedAssetsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kToroHeaderColor,
//         title: const Text('Home'),
//       ),
//       body: const Body(),
//     );
//   }
// }
