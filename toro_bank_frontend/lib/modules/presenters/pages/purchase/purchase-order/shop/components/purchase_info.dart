// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/purchase_validator.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_process_payment.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/default_button.dart';

// ignore: must_be_immutable
class PurchaseInfo extends StatefulWidget {
  final String assetName;
  final double value;
  final double actualBalance;
  final String image;
  final User user;

  PurchaseInfo({
    Key? key,
    required this.assetName,
    required this.value,
    required this.actualBalance,
    required this.image,
    required this.user,
  }) : super(key: key);

  double total = 0;

  @override
  State<PurchaseInfo> createState() => _PurchaseInfoState();
}

class _PurchaseInfoState extends State<PurchaseInfo> {
  double _total = 0;
  double _actualBalance = 0;
  bool _showValidator = false;
  bool _disableButton = true;
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    var assetName = widget.assetName;
    var assetValue = widget.value;
    var imageName = widget.image;

    @override
    void initState() {
      super.initState();

      debugPrint('inicializa ordem');
      debugPrint(widget.image);

      _amount = 0;
      _total = 0;
      _actualBalance = widget.actualBalance;
      _showValidator = false;
      _disableButton = true;
    }

    String fixValueIfNull(String? value) {
      return (value == '' ? '0' : value.toString());
    }

    setState(() {});

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
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: imageName == ''
                      ? null
                      : AssetImage('assets/images/$imageName'),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                assetName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                FormatHelper().getCurrency(assetValue),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.end,
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
                  debugPrint('Total no inicio: $_total');
                  debugPrint('---------COMPRANDO------------');
                  debugPrint('Saldo antes da compra: ' +
                      widget.actualBalance.toString());
                  //debugPrint(widget.actualBalance.toString());

                  setState(() {
                    _total = (double.parse(fixValueIfNull(value)) * assetValue);
                    _actualBalance = widget.actualBalance - _total;
                    _amount = int.parse(fixValueIfNull(value));
                  });

                  debugPrint('---------FINALIZANDO------------');
                  debugPrint('Total no fim: $_total');
                  debugPrint('Saldo depois da compra: $_actualBalance');

                  _disableButton = (value == null || value == '');
                  _showValidator = (_actualBalance < 0);
                },
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        FormatHelper().getCurrency(_total),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        if (_showValidator) const PurchaseValidator() else Container(),
        DefaultButtom(
          text: 'CONFIRMAR',
          pressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PurchaseProcessPayment(
                        userId: widget.user.id,
                        amount: _amount,
                        symbol: assetName)));
          },
          disabled: _showValidator || _disableButton,
        ),
      ]),
    );
  }
}
