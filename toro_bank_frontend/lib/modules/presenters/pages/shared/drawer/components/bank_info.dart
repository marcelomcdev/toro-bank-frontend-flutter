import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';

class BankInfo extends StatelessWidget {
  const BankInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 59.9,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 0.0),
          child: Column(
            children: const [
              Text(
                'Banco Toro',
                style: TextStyle(color: kToroHeaderColor),
              ),
              Text(
                'Agencia: 352',
                style: TextStyle(color: kToroHeaderColor),
              ),
            ],
          ),
        ));
  }
}
