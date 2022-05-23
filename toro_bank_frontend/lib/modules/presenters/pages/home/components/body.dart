import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toro_bank_frontend/modules/domain/entities/positions.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_position.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_position_model.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_position_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/account_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/patrimony_info.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/skelton.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var datasource = UserResponseDataSource(Dio());
  var userPositionDataSource = UserPositionResponseDataSource(Dio());
  double balance = 0;
  late String balanceCurrency = '';
  late User user = User(0, '', 0, '', 0.0);
  final _headerColumnNames = ['', 'Ativo', 'Qte', 'Valor'];
  final List<UserAsset> _userAssets = [];
  UserPosition userPosition =
      UserPosition(0.0, 0.0, 0.0, positions: <Positions>[]);
  List<ResultPositions> positions = [];

  late final SharedPreferences prefs;
  late bool _isLoading = true;
  late int userId = 0;

  getUser(int userId) async {
    await datasource.getUser(userId).then((value) => {
          user = value,
        });
  }

  getPositions(int id) async {
    await userPositionDataSource.getPositions(id).then((item) {
      var listPositions = item.positions!.cast<Positions>().toList();
      userPosition = UserPosition(
          item.checkingAccountAmount, item.consolidated, item.investments,
          positions: listPositions);
    });
  }

  @override
  void initState() {
    super.initState();

    _isLoading = true;
    debugPrint('state iniciado');
    Future.delayed(const Duration(seconds: 0), () async {
      prefs = await SharedPreferences.getInstance();
      //await prefs.setInt("userId", user.id);
      userId = prefs.getInt("userId");

      await getUser(userId);
      await getPositions(user.id);

      setState(() {
        balance = user.balance;
        _isLoading = false;
      });
    });

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
      await getUser(userId);
      await getPositions(user.id);
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
      child: _isLoading
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: getProportionateScreenWidth(500),
                    height: getProportionateScreenHeight(180),
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(children: const [
                      Skelton(
                        height: 15,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                      ),
                      Skelton(
                        height: 32,
                        width: 220,
                        margin: EdgeInsets.only(bottom: 30),
                      )
                    ]),
                  ),
                  Container(
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
                        children: const [
                          Skelton(
                            height: 80,
                            width: 350,
                            margin: EdgeInsets.only(left: 18, bottom: 10),
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Skelton(
                                height: 20,
                                width: 250,
                                margin: EdgeInsets.only(left: 18, bottom: 20),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Skelton(
                            height: 280,
                            width: 350,
                            margin: EdgeInsets.only(left: 0, bottom: 90),
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                      )
                    ]),
                  )
                ],
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(0)),
                child: ListView(children: [
                  PatrimonyInfo(
                    consolidated: userPosition.consolidated,
                    userName: user.name.split(' ')[0],
                  ),
                  AccountInfo(
                    balance: userPosition.checkingAccountAmount,
                    userAssets: userPosition.positions,
                    headerColumnNames: _headerColumnNames,
                    investiments: userPosition.investments,
                  ),
                ]),
              ),
            ),
    );
  }
}
