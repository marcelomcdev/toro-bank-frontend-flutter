// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/trend_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/components/custom_table_negotiated_assets.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> _headerColumnNames = ['', 'Ativo', 'Valor', ''];
  //List<UserAsset> _userAssets = [];
  var datasource = TrendResponseDataSource(Dio());

  List<Trend> _trends = [];

  @override
  void initState() {
    super.initState();

    print('inicia state de negociados');
    Future.delayed(const Duration(seconds: 0), () async {
      await getTrends();
      setState(() {});
    });
  }

  getTrends() async {
    await datasource.getTrends().then((value) => {
          _trends = value,
        });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('refresh state');
  }

  Future<void> _pullRefresh() async {
    print('pulled...');
    Future.delayed(const Duration(seconds: 0), () async {
      await getTrends();
      setState(() {});
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
                          'Estes são os ativos mais negociados nos últimos 7 dias e \njá estão disponíveis para compra.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
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
                          userAssets: _trends,
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
