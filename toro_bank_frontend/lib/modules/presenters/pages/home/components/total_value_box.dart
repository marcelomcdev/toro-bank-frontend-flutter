import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';

class TotalValueBox extends StatelessWidget {
  final String title;
  final String value;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const TotalValueBox(
      {Key? key,
      this.title = '',
      this.value = '',
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD4D4D4),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kToroTextColor,
              fontFamily: 'Muli',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: const TextStyle(
              color: kToroBlackColor,
              fontFamily: 'Muli',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
