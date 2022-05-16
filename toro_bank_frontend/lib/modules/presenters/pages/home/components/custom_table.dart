import 'package:flutter/material.dart';

import 'package:toro_bank_frontend/modules/domain/entities/user_asset.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';

class CustomTable extends StatelessWidget {
  final List<String> headerColumnNames;
  final List<UserAsset> userAssets;

  const CustomTable(
      {Key? key, required this.userAssets, required this.headerColumnNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          DataTable(
            sortColumnIndex: 1,
            sortAscending: true,
            columns: _buildTableHeader(headerColumnNames).toList(),
            rows: userAssets
                .map((e) => _buildDataRow(e.image, e.name, e.quantity, e.value,
                    highlightName: true))
                .toList(),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildTableHeader(List<String> items) {
    List<DataColumn> listReturn = List.generate(
        items.length,
        (index) => DataColumn(
              label: Text(items[index]),
            ));
    return listReturn;
  }

  DataRow _buildDataRow(
      String imageName, String text, int? quantity, double value,
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
      DataCell(Text(FormatHelper().getCurrency(value))),
    ]);
  }
}
