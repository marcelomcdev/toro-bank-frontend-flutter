import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/body.dart';

class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage({Key? key}) : super(key: key);

  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: kToroHeaderColor,
        title: const Text('Ordem de Compra'),
      ),
      body: const Body(),
    );
  }
}
