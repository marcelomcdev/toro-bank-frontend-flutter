import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/custom_table.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/total_value_box.dart';

class AccountInfo extends StatelessWidget {
  final double balance;
  final List<String> headerColumnNames;
  final List<UserAsset> userAssets;
  const AccountInfo({
    Key? key,
    required this.balance,
    required this.headerColumnNames,
    required this.userAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TotalValueBox(
              title: 'Seus ativos',
              value: 'R\$ 15.655,79',
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 5.0),
            ),
            TotalValueBox(
              title: 'Seu saldo',
              value: balance == 0.0 ? '-' : FormatHelper().getCurrency(balance),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Ativos que eu comprei',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            CustomTable(
              userAssets: userAssets,
              headerColumnNames: headerColumnNames,
            )
          ],
        ),
        const SizedBox(
          height: 150,
        )
      ]),
    );
  }
}
