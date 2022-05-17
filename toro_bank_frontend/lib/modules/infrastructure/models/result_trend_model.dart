import 'dart:convert';

import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';

class ResultTrendModel extends Trend {
  ResultTrendModel(int id, String symbol, double currentPrice, String image)
      : super(id, symbol, currentPrice, image);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'currentPrice': currentPrice});
    result.addAll({'image': image});

    return result;
  }

  factory ResultTrendModel.fromMap(Map<String, dynamic> map) {
    return ResultTrendModel(
      map['id']?.toInt() ?? 0,
      map['symbol'] ?? '',
      map['currentPrice']?.toDouble() ?? 0.0,
      map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultTrendModel.fromJson(String source) =>
      ResultTrendModel.fromMap(json.decode(source));
}
