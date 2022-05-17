import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/components/body.dart';

class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage({Key? key, required this.trend}) : super(key: key);
  final Trend trend;
  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kToroHeaderColor,
        title: const Text('Ordem de Compra'),
      ),
      body: Body(trend: widget.trend),
    );
  }
}
