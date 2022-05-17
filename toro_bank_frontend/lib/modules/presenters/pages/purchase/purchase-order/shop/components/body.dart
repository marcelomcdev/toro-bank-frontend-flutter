import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/balance_account_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/purchase_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/user_info.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.trend}) : super(key: key);
  final Trend trend;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double actualBalance = 11543.25;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const UserInfo(
            name: 'Jorge Santana dos Santos',
            bank: 'Banco: 352',
            account: 'Conta: 300123',
            assetProfileImage: 'assets/images/Profile Image.png'),
        const Divider(),
        BalanceAccountInfo(
          balance: actualBalance,
        ),
        const Divider(),
        PurchaseInfo(
          assetName: widget.trend.symbol,
          value: widget.trend.currentPrice,
          actualBalance: actualBalance,
          image: widget.trend.image,
        ),
      ]),
    );
  }
}
