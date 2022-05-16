import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PurchaseInfo extends StatelessWidget {
  final String assetName;
  final double value;
  const PurchaseInfo({
    Key? key,
    required this.assetName,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(13.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        Row(
          children: const [
            Expanded(
              flex: 5,
              child: Text('Ativo'),
            ),
            Expanded(
              flex: 2,
              child: Text('Valor Unitário'),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/toro.png'),
                ),
              ),
            ),
            const Expanded(
              flex: 6,
              child: Text(
                'CMG3',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Text(
                'R\$ 23,44',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
        Row(
          children: const [Text('Quantidade')],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  hintText: 'Informe o valor',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (String? value) {
                  //roda quando muda o valor
                  debugPrint(value);
                },
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              flex: 3,
              child: Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'R\$ 427,50',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
