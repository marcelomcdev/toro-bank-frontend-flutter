import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/order_response_datasource.dart';
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
  String response = '';
  int userId = 0;
  int amount = 0;
  String symbol = '';
  var datasource = OrderResponseDataSource(Dio());

  @override
  void initState() {
    super.initState();

    userId = widget.userId;
    amount = widget.amount;
    symbol = widget.symbol;

    Future.delayed(const Duration(seconds: 2), () async {
      debugPrint('Processando pagamento...');
      debugPrint('Dados enviados: $userId, $symbol, $amount');

      await datasource.submitOrder(userId, symbol, amount).then((value) => {
            response = value,
          });

      debugPrint('Finalizou processamento...');
      debugPrint('Enviando para pagina de conclusão');

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
    response = '';
    userId = widget.userId;
    amount = widget.amount;
    symbol = widget.symbol;

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
            child: Lottie.asset('assets/json/card-payment-in-process.json'),
          ),
        ),
      ]),
    );
  }
}
