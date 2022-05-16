import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/size_config.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String bank;
  final String account;
  final String assetProfileImage;

  const UserInfo({
    Key? key,
    required this.name,
    required this.bank,
    required this.account,
    this.assetProfileImage = 'assets/images/toro.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(assetProfileImage),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  Text(name),
                ],
              ),
              Row(
                children: [
                  Text(bank),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(25)),
                    child: Text(
                      account,
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
