import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';

class BalanceAccountInfo extends StatelessWidget {
  final double balance;
  const BalanceAccountInfo({
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: const [Text('De onde retirar')],
              ),
            ),
            Row(
              children: [
                const Expanded(
                  flex: 9,
                  child: Text('Conta Corrente'),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FormatHelper().getCurrency(balance),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
