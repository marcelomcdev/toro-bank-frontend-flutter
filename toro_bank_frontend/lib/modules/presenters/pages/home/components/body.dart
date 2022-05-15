import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/total_value_box.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final _userAssets = List.generate(
  //     0,
  //     (index) => {
  //           {"id": 1, "name": "CMG4", "value": 14.55, "acquired": 11},
  //           {"id": 2, "name": "MGLU3", "value": 55.86, "acquired": 30},
  //           {"id": 3, "name": "VVAL6", "value": 84.44, "acquired": 21},
  //           {"id": 4, "name": "TORO4", "value": 104.25, "acquired": 51},
  //         },
  //     growable: true);

  var datasource = UserResponseDataSource(Dio());
  double balance = 0;
  late String balanceCurrency = '';
  late User user = User(0, '', 0, '', 0.0);

  getCurrentUser() async {
    await datasource.getUser(1).then((value) => {
          balance = value.balance,
        });
  }

  getUser() async {
    await datasource.getUser(1).then((value) => {
          user = value,
        });
  }

  String getCurrency(double value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  List<UserAsset> _userAssets = [];

  @override
  void initState() {
    super.initState();
    print('state iniciado');
    Future.delayed(const Duration(seconds: 1), () async {
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

    //Carrega lista de ativos
    // _userAssets = List.generate(
    //     0,
    //     (index) => {
    //           {"id": 1, "name": "CMG4", "value": 120.44, "acquired": 50},
    //           {"id": 2, "name": "MGLU3", "value": 88.23, "acquired": 11},
    //           {"id": 3, "name": "VAL3", "value": 74.95, "acquired": 18},
    //           {"id": 4, "name": "NATU5", "value": 60.83, "acquired": 48},
    //           {"id": 5, "name": "TORO4", "value": 115.64, "acquired": 38},
    //         },
    //     growable: true);

    setState(() {
      //_userAssets = generateItems();
    });
  }

  // late List<Set<Map<String, UserAsset>>> _userAssets = [];
  // List<Set<Map<String, UserAsset>>> generateItems() {
  //   return List.generate(
  //       5,
  //       (int index) => {
  //             UserAsset(1, "CMG4", 50, 120.44, "cemig"),
  //             UserAsset(2, "MGLU3", 11, 88.23, "magalu"),
  //             UserAsset(3, "VAL3", 18, 74.95, "vale"),
  //             UserAsset(4, "NATU5", 48, 60.83, "natura"),
  //             UserAsset(5, "TORO4", 38, 115.64, "toro"),

  //             // {"id": 1, "name": "CMG4", "value": 120.44, "acquired": 50},
  //             // {"id": 2, "name": "MGLU3", "value": 88.23, "acquired": 11},
  //             // {"id": 3, "name": "VAL3", "value": 74.95, "acquired": 18},
  //             // {"id": 4, "name": "NATU5", "value": 60.83, "acquired": 48},
  //             // {"id": 5, "name": "TORO4", "value": 115.64, "acquired": 38},
  //           },
  //       growable: true);
  // }

  // List<Set<Map<String, Object>>> generateItems() {
  //   return List.generate(
  //       0,
  //       (index) => {
  //             {"id": 1, "name": "CMG4", "value": 120.44, "acquired": 50},
  //             {"id": 2, "name": "MGLU3", "value": 88.23, "acquired": 11},
  //             {"id": 3, "name": "VAL3", "value": 74.95, "acquired": 18},
  //             {"id": 4, "name": "NATU5", "value": 60.83, "acquired": 48},
  //             {"id": 5, "name": "TORO4", "value": 115.64, "acquired": 38},
  //           },
  //       growable: true);
  // }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('refresh state');
  }

  Future<void> _pullRefresh() async {
    print('pulled...');
    Future.delayed(const Duration(seconds: 1), () async {
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
                  //color: kToroTextColor,
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
                      value: getCurrency(balance), //'1.543,25',
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
                    DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: _buildTableHeader(['', 'Ativo', 'Qte', 'Valor'])
                          .toList(),
                      //[

                      // const DataColumn(
                      //   label: Text('Ativo'),
                      // ),
                      // const DataColumn(label: Text('Qte'), numeric: true),
                      // const DataColumn(label: Text('Valor'), numeric: true),
                      //],
                      rows: _userAssets
                          .map((e) => _buildDataRow(
                              e.image, e.name, e.quantity, e.value,
                              highlightName: true))
                          .toList(),
                      // [
                      //   _buildDataRow('cemig.png', 'CMG4', 50, 120.44,
                      //       highlightName: true),
                      //   _buildDataRow('magalu.png', 'MGLU3', 11, 88.23,
                      //       highlightName: true),
                      //   _buildDataRow('vale.png', 'VAL3', 18, 74.95,
                      //       highlightName: true),
                      //   _buildDataRow('natura.png', 'NATU7', 48, 60.83,
                      //       highlightName: true),
                      //   _buildDataRow('toro.png', 'TORO', 38, 115.64,
                      //       highlightName: true),
                      //]
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildTableHeader(List<String> lista) {
    List<DataColumn> listReturn = List.generate(
        lista.length,
        (index) => DataColumn(
              label: Text(lista[index]),
            ));
    // lista
    //     .map((e) => listReturn.add(DataColumn(
    //           label: Text(e),
    //         )))
    //     .toList();
    return listReturn;
    // return DataColumn(
    //   label: Text(text),
    // );
  }

  DataRow _buildDataRow(
      String imageName, String text, int quantity, double value,
      {bool highlightName = false}) {
    return DataRow(cells: [
      DataCell(
        CircleAvatar(
          radius: 15,
          backgroundImage: imageName.contains('/')
              ? AssetImage(imageName)
              : AssetImage('assets/images/$imageName'),
        ),
      ),
      DataCell(
        Text(
          text,
          style: TextStyle(
              fontWeight: highlightName ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
              fontSize: 15),
        ),
      ),
      DataCell(Text(quantity.toString())),
      DataCell(Text(getCurrency(value))),
    ]);
  }
}


// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

  // var saldo = 0.0;
  // Future<double> getSaldo() async {
  //   Dio dio = Dio();
  //   var service = UserResponseDataSource(dio);
  //   Future<ResultUserModel> result = service.getUser(1);
  //   saldo = 0.0;
  //   result.then((value) => saldo = value.balance);
  //   return saldo;
  // }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
//           child: Column(
//             children: [
//               Container(
//                 width: getProportionateScreenWidth(500),
//                 height: getProportionateScreenHeight(180),
//                 color: kToroTextColor,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   TotalValueBox(
//                     title: 'Seu patrimônio',
//                     value: 'R\$ 2260,62',
//                     padding: EdgeInsets.all(10.0),
//                   ),
//                   TotalValueBox(
//                     title: 'Seu saldo',
//                     value: '1543,25',
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TotalValueBox extends StatelessWidget {
//   final String title;
//   final String value;
//   final EdgeInsetsGeometry padding;

//   const TotalValueBox(
//       {Key? key,
//       this.title = '',
//       this.value = '',
//       this.padding = const EdgeInsets.all(0)})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5.0),
//       padding: padding,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: const Color(0xFFD4D4D4),
//           ),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//           boxShadow: const [
//             BoxShadow(
//               blurRadius: 10,
//               color: Colors.grey,
//               offset: Offset(1, 3),
//             ),
//           ]),
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               color: kToroTextColor,
//               fontFamily: 'Muli',
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//               color: kToroBlackColor,
//               fontFamily: 'Muli',
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
