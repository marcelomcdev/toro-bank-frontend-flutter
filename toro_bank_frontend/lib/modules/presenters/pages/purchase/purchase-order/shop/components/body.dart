import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [
        UserInfo(),
        Divider(),
        BalanceAccountInfo(),
        Divider(),
        PurchaseInfo(),
        Divider(),
        PurchaseValidator(),
        CustomButtom(),
      ]),
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(13.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color.fromARGB(255, 42, 2, 87),
                      Color.fromARGB(255, 63, 13, 121),
                      Color.fromARGB(255, 90, 15, 177),
                    ])),
                  )),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15),
                        primary: Colors.white,
                        //backgroundColor: kToroTextColor,
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text(
                      'CONFIRMAR',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

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
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ]),
    );
  }
}

class PurchaseInfo extends StatelessWidget {
  const PurchaseInfo({
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
                //color: Colors.amber,
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
                  //icon: Icon(Icons.request_quote_outlined),
                  hintText: 'Informe o valor',

                  //labelText: 'Quantidade',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // onSaved: (String? value) {
                //   //roda o codigo quando o usuario salvar o form
                // },
                onChanged: (String? value) {
                  //roda quando muda o valor
                  debugPrint(value);
                },
                // validator: (String? value) {
                //   debugPrint('validate $value');
                //   return (value != null && value == '0')
                //       ? 'Valor zero não é aceito'
                //       : null;
                // },
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

class BalanceAccountInfo extends StatelessWidget {
  const BalanceAccountInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: const [Text('De onde retirar')],
              ),
            ),
            Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: Text('Conta Corrente'),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 11543,25',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.cyan,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            //color: Colors.amber,
            padding: const EdgeInsets.all(8.0),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/Profile Image.png'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            //color: Colors.greenAccent,
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: const [
                  Text(
                    'Jorge Santana dos Santos',
                    //style: TextStyle(color: kToroTextColor),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Banco: 352',
                    //style: TextStyle(color: kToroTextColor),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(25)),
                    child: const Text(
                      'Conta: 300123',
                      //style: TextStyle(color: kToroTextColor),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
