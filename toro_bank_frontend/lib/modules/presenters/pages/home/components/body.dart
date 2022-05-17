import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/account_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/patrimony_info.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var datasource = UserResponseDataSource(Dio());
  double balance = 0;
  late String balanceCurrency = '';
  late User user = User(0, '', 0, '', 0.0);
  final _headerColumnNames = ['', 'Ativo', 'Qte', 'Valor'];
  List<UserAsset> _userAssets = [];

  late final SharedPreferences prefs;

  getUser() async {
    await datasource.getUser(1).then((value) => {
          user = value,
        });
  }

  @override
  void initState() {
    super.initState();
    debugPrint('state iniciado');
    Future.delayed(const Duration(seconds: 0), () async {
      await getUser();
      setState(() {
        balance = user.balance;
      });
      prefs = await SharedPreferences.getInstance();
      await prefs.setInt("userId", user.id);
      //await FlutterSession().set("userId", user.id);
    });

    _userAssets = [
      UserAsset(1, "CMG4", 50, 120.44, "cemig.png"),
      UserAsset(2, "MGLU3", 11, 88.23, "magalu.png"),
      UserAsset(3, "VAL3", 18, 74.95, "vale.png"),
      UserAsset(4, "NATU5", 48, 60.83, "natura.png"),
      UserAsset(5, "TORO4", 38, 115.64, "toro.png"),
    ];

    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    debugPrint('refresh state');
  }

  Future<void> _pullRefresh() async {
    debugPrint('pulled...');
    Future.delayed(const Duration(seconds: 0), () async {
      await getUser();
      setState(() {
        balance = user.balance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: () => _pullRefresh(),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
          child: ListView(children: [
            const PatrimonyInfo(),
            AccountInfo(
              balance: balance,
              userAssets: _userAssets,
              headerColumnNames: _headerColumnNames,
            ),
          ]),
        ),
      ),
    );
  }
}
