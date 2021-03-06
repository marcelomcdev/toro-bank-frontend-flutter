import 'package:flutter/material.dart';

import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/size_config.dart';

class PatrimonyInfo extends StatelessWidget {
  final double consolidated;
  final String userName;
  const PatrimonyInfo({
    Key? key,
    required this.consolidated,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(500),
      height: getProportionateScreenHeight(180),
      padding: const EdgeInsets.only(top: 30),
      child: Column(children: [
        Text(
          'Olá $userName, seu patrimônio hoje:',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Muli',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          FormatHelper().getCurrency(consolidated),
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Muli',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
