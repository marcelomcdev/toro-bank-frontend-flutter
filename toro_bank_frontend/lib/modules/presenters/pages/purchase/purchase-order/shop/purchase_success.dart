import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/most_negotiated_page.dart';

class PurchaseSuccessPage extends StatefulWidget {
  const PurchaseSuccessPage({Key? key}) : super(key: key);

  @override
  State<PurchaseSuccessPage> createState() => _PurchaseSuccessPageState();
}

class _PurchaseSuccessPageState extends State<PurchaseSuccessPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.fade,
          child: const MostNegotiatedAssetPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: kToroTextColor,
      child: Column(children: [
        const SizedBox(
          height: 165,
        ),
        SizedBox(
          width: 250,
          height: 250,
          child: Center(
            child: Lottie.asset('assets/json/done.json'),
          ),
        ),
      ]),
    );
  }
}
