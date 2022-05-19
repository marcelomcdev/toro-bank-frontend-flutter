import 'package:toro_bank_frontend/modules/domain/entities/positions.dart';

class ResultPositions extends Positions {
  @override
  String symbol = '';
  @override
  int amount = 0;
  @override
  double currentPrice = 0.0;
  @override
  String image = '';

  ResultPositions(
      {required this.symbol,
      required this.amount,
      required this.currentPrice,
      required this.image})
      : super('', 0, 0.0, '');

  ResultPositions.fromJson(Map<String, dynamic> json) : super('', 0, 0.0, '') {
    symbol = json['symbol'];
    amount = json['amount'];
    currentPrice = json['currentPrice'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['amount'] = amount;
    data['currentPrice'] = currentPrice;
    data['image'] = image;

    return data;
  }
}
