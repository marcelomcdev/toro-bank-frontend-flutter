// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';

import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_order.dart';

class CustomTableNegotiatedAssets extends StatelessWidget {
  final List<String> headerColumnNames;
  final List<UserAsset> userAssets;

  const CustomTableNegotiatedAssets(
      {Key? key, required this.userAssets, required this.headerColumnNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataTable(
            sortColumnIndex: 0,
            sortAscending: true,
            columns: _buildTableHeader(headerColumnNames).toList(),
            rows: userAssets
                .map((e) => _buildDataRow(
                    context, e.id, e.image, e.name, e.value,
                    highlightName: true))
                .toList(),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildTableHeader(List<String> items) {
    List<DataColumn> listReturn = List.generate(
        items.length, (index) => DataColumn(label: Text(items[index])));
    return listReturn;
  }

  DataRow _buildDataRow(
      BuildContext context, int id, String imageName, String text, double value,
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
      //DataCell(Text(quantity.toString())),
      DataCell(Text(FormatHelper().getCurrency(value))),
      DataCell(IconButton(
          icon: const Icon(Icons.add_sharp),
          color: kToroTextColor,
          iconSize: 20,
          padding: const EdgeInsets.only(right: 0),
          onPressed: () async {
            print('clicado id= $id');
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PurchaseOrderPage()));
          })),
    ]);
  }
}
