// ignore_for_file: prefer_typing_uninitialized_variables

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
    final response = await dio.get('$kBaseUrl/trends');
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
