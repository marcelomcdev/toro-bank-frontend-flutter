import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';
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
  double actualBalance = 0.0;
  var datasource = UserResponseDataSource(Dio());
  late User user = User(0, '', 0, '', 0.0);

  @override
  void initState() {
    super.initState();
    debugPrint('Compra - estado iniciado');

    Future.delayed(const Duration(seconds: 0), () async {
      var id = await FlutterSession().get("userId");
      debugPrint('usuario: $id');
      await datasource.getUser(id).then((value) => {
            user = value,
          });
      setState(() {
        actualBalance = user.balance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        UserInfo(
            name: user.name,
            bank: 'Banco: 352',
            account: 'Conta: ' + user.accountNumber.toString(),
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
          user: user,
        ),
      ]),
    );
  }
}
