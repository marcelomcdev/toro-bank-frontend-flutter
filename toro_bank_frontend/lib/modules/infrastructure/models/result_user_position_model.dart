import 'package:toro_bank_frontend/modules/domain/entities/user_position.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_position_model.dart';

class ResultUserPositionModel extends UserPosition {
  @override
  List<ResultPositions>? positions = [];
  @override
  double checkingAccountAmount = 0.0;
  @override
  double consolidated = 0.0;
  @override
  double investments = 0.0;

  ResultUserPositionModel(
      {this.positions,
      required this.checkingAccountAmount,
      required this.consolidated,
      required this.investments})
      : super(0.0, 0.0, 0.0, positions: <ResultPositions>[]);

  ResultUserPositionModel.fromJson(Map<String, dynamic> json)
      : super(0.0, 0.0, 0.0, positions: <ResultPositions>[]) {
    if (json['positions'] != null) {
      positions = <ResultPositions>[];
      json['positions'].forEach((v) {
        positions!.add(ResultPositions.fromJson(v));
      });
    }
    checkingAccountAmount = json['checkingAccountAmount'];
    consolidated = json['consolidated'];
    investments = json['investments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (positions != null) {
      data['positions'] = positions!.map((v) => v.toJson()).toList();
    }
    data['checkingAccountAmount'] = checkingAccountAmount;
    data['consolidated'] = consolidated;
    data['investments'] = investments;
    return data;
  }
}



// class ResultPositions extends Positions {
//   @override
//   String symbol = '';
//   @override
//   int amount = 0;
//   @override
//   double currentPrice = 0.0;

//   ResultPositions(
//       {required this.symbol, required this.amount, required this.currentPrice})
//       : super('', 0, 0.0);


//   ResultPositions.fromJson(Map<String, dynamic> json) {
//     symbol = json['symbol'];
//     amount = json['amount'];
//     currentPrice = json['currentPrice'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['symbol'] = symbol;
//     data['amount'] = amount;
//     data['currentPrice'] = currentPrice;
//     return data;
//   }
// }

