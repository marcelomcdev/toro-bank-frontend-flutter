import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/custom_table.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/total_value_box.dart';
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

  getUser() async {
    await datasource.getUser(1).then((value) => {
          user = value,
        });
  }

  String getCurrency(double value) {
    return FormatHelper().getCurrency(value);
    // NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    // return formatter.format(value);
  }

  @override
  void initState() {
    super.initState();
    print('state iniciado');
    Future.delayed(const Duration(seconds: 0), () async {
      await getUser();
      setState(() {
        balance = user.balance;
      });
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
    print('refresh state');
  }

  Future<void> _pullRefresh() async {
    print('pulled...');
    Future.delayed(const Duration(seconds: 0), () async {
      await getUser();
      setState(() {
        balance = user.balance;
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
                horizontal: getProportionateScreenWidth(0)),
            child: ListView(
              children: [
                Container(
                  width: getProportionateScreenWidth(500),
                  height: getProportionateScreenHeight(180),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fundo-futuristic.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(children: const [
                    Text(
                      'Seu patrimônio',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Muli',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'R\$ 17.199,04',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Muli',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TotalValueBox(
                      title: 'Seus ativos',
                      value: 'R\$ 15.655,79',
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 1.5, vertical: 5.0),
                    ),
                    TotalValueBox(
                      title: 'Seu saldo',
                      value: balance == 0.0 ? '-' : getCurrency(balance),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 1.5, vertical: 5),
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
                      userAssets: _userAssets,
                      headerColumnNames: _headerColumnNames,
                    )
                    //   DataTable(
                    //     sortColumnIndex: 1,
                    //     sortAscending: true,
                    //     columns: _buildTableHeader(_headerColumnNames).toList(),
                    //     rows: _userAssets
                    //         .map((e) => _buildDataRow(
                    //             e.image, e.name, e.quantity, e.value,
                    //             highlightName: true))
                    //         .toList(),
                    //   ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<DataColumn> _buildTableHeader(List<String> items) {
  //   List<DataColumn> listReturn = List.generate(
  //       items.length,
  //       (index) => DataColumn(
  //             label: Text(items[index]),
  //           ));
  //   return listReturn;
  // }

  // DataRow _buildDataRow(
  //     String imageName, String text, int quantity, double value,
  //     {bool highlightName = false}) {
  //   return DataRow(cells: [
  //     DataCell(
  //       CircleAvatar(
  //         radius: 15,
  //         backgroundImage: imageName.contains('/')
  //             ? AssetImage(imageName)
  //             : AssetImage('assets/images/$imageName'),
  //       ),
  //     ),
  //     DataCell(
  //       Text(
  //         text,
  //         style: TextStyle(
  //             fontWeight: highlightName ? FontWeight.bold : FontWeight.normal,
  //             color: Colors.black,
  //             fontSize: 15),
  //       ),
  //     ),
  //     DataCell(Text(quantity.toString())),
  //     DataCell(Text(getCurrency(value))),
  //   ]);
  // }
}
