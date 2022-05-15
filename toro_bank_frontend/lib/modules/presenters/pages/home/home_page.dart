import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/components/body.dart';
import 'package:toro_bank_frontend/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kToroHeaderColor,
        title: const Text(
          'Resumo do Patrimônio',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: const Body(),
    );
  }
}
