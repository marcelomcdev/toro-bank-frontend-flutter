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
        title: const Text('Home'),
      ),
      body: const Body(),
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
