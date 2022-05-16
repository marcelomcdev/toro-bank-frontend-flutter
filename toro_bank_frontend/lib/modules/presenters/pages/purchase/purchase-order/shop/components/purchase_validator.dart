import 'package:flutter/material.dart';

class PurchaseValidator extends StatelessWidget {
  const PurchaseValidator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(13.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
            Text(
              'Saldo Indisponível',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ]),
    );
  }
}
