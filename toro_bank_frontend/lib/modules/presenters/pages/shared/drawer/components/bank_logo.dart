import 'package:flutter/material.dart';

class BankLogo extends StatelessWidget {
  const BankLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 65.0,
      left: 68.0,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/toro.png'),
        ),
      ),
    );
  }
}
