import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_success.dart';

class PurchaseProcessPayment extends StatefulWidget {
  final int userId;
  final String symbol;
  final int amount;

  const PurchaseProcessPayment(
      {Key? key,
      required this.userId,
      required this.symbol,
      required this.amount})
      : super(key: key);

  @override
  State<PurchaseProcessPayment> createState() => _PurchaseProcessPaymentState();
}

class _PurchaseProcessPaymentState extends State<PurchaseProcessPayment> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      //Processa pagamento

      //no final, encaminha para a pagina de sucesso

      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.fade,
          child: const PurchaseSuccessPage(),
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
          width: 200,
          height: 200,
          child: Center(
            // child: Lottie.network(
            //     'https://assets6.lottiefiles.com/datafiles/o32OV1wYkYc7mZD/data.json'),
            child: Lottie.asset('assets/json/card-payment-in-process.json'),
          ),
        ),
      ]),
    );
  }
}
