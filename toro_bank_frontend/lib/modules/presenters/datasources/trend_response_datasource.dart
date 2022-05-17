import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/trend_datasource.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_trend_model.dart';

class TrendResponseDataSource implements TrendDataSource {
  final Dio dio;
  TrendResponseDataSource(this.dio);
  String genericError = "Erro ao retornar usuário";
  var nullValue;

  // ignore: non_constant_identifier_names
  Future<bool> IsValidResponse(Response<dynamic> response) async {
    return (response != nullValue && response.statusCode == 200);
  }

  var kUrlBase = '';

  @override
  Future<List<ResultTrendModel>> getTrends() async {
    var body = jsonEncode({"pageNumber": 1, "pageSize": 5});
    final response = await dio.post('$kBaseUrl/trends', data: body);
    if (await IsValidResponse(response)) {
      final list = (response.data as List)
          .map((e) => ResultTrendModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw TrendDataSourceError("$genericError por tendência!");
    }
  }
}
