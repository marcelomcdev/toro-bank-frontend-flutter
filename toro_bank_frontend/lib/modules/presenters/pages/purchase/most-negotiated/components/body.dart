// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/components/custom_table_negotiated_assets.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> _headerColumnNames = ['', 'Ativo', 'Valor', ''];
  List<UserAsset> _userAssets = [];

  @override
  void initState() {
    super.initState();

    _userAssets = [
      UserAsset(1, "CMG4", 50, 120.44, "cemig.png"),
      UserAsset(2, "MGLU3", 11, 88.23, "magalu.png"),
      UserAsset(3, "VAL3", 18, 74.95, "vale.png"),
      UserAsset(4, "NATU5", 48, 60.83, "natura.png"),
      UserAsset(5, "TORO4", 38, 115.64, "toro.png"),
    ];
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('refresh state');
  }

  getUser() async {
    // await datasource.getUser(1).then((value) => {
    //       user = value,
    //     });
  }

  Future<void> _pullRefresh() async {
    print('pulled...');
    Future.delayed(const Duration(seconds: 1), () async {
      await getUser();
      setState(() {
        //balance = user.balance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        backgroundColor: Colors.white,
        onRefresh: () => _pullRefresh(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(5.0)),
            child: ListView(
              children: [
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
                          'Estes são os ativos mais negociados nos últimos \n7 dias e já estão disponíveis para compra.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTableNegotiatedAssets(
                          userAssets: _userAssets,
                          headerColumnNames: _headerColumnNames,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
