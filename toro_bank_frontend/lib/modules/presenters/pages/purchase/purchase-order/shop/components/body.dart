import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/balance_account_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/purchase_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/purchase_validator.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/user_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const UserInfo(
            name: 'Jorge Santana dos Santos',
            bank: 'Banco: 352',
            account: 'Conta: 300123'),
        const Divider(),
        const BalanceAccountInfo(
          balance: 11543.25,
        ),
        const Divider(),
        const PurchaseInfo(
          assetName: 'CMG3',
          value: 23.44,
        ),
        const Divider(),
        const PurchaseValidator(),
        DefaultButtom(
          text: 'text',
          pressed: () {},
        ),
      ]),
    );
  }
}
