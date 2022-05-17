import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toro_bank_frontend/modules/presenters/helpers/format_helper.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/purchase_validator.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_success.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/default_button.dart';

// ignore: must_be_immutable
class PurchaseInfo extends StatefulWidget {
  final String assetName;
  final double value;
  final double actualBalance;
  final String image;

  PurchaseInfo({
    Key? key,
    required this.assetName,
    required this.value,
    required this.actualBalance,
    required this.image,
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

  @override
  Widget build(BuildContext context) {
    var assetName = widget.assetName;
    var assetValue = widget.value;
    var imageName = widget.image;

    @override
    void initState() {
      super.initState();

      print('inicializa ordem');
      print(widget.image);

      _total = 0;
      _actualBalance = widget.actualBalance;
      _showValidator = false;
      _disableButton = true;
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
                    _total = (double.parse(value == null || value == ''
                            ? '0'
                            : value.toString()) *
                        assetValue);
                    _actualBalance = widget.actualBalance - _total;
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
            if (!(_showValidator || _disableButton)) {
              //compra é válida.
              //debitar o saldo
              //adicionar novos ativos ao cliente atual.
              //fazer isso na tela de processamento
            }

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const PurchaseSuccessPage()));
          },
          disabled: _showValidator || _disableButton,
        ),
      ]),
    );
  }
}
