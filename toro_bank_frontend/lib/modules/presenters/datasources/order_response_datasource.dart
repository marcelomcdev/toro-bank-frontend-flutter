// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/order_datasource.dart';

class OrderResponseDataSource implements OrderDataSource {
  final Dio dio;
  OrderResponseDataSource(this.dio);
  String genericError = "Erro ao retornar usuário";
  var nullValue;

  @override
  Future<String> submitOrder(int userId, String symbol, int amount) async {
    var body = jsonEncode({
      "userId": userId,
      "symbol": symbol,
      "amount": amount,
    });
    final response = await dio.post('$kBaseUrl/order', data: body);

    if (await isValidResponse(response)) {
      return response.data;
    } else {
      throw OrderDataSourceError("$genericError!");
    }
  }

  Future<bool> isValidResponse(Response<dynamic> response) async {
    return (response != nullValue && response.statusCode == 201);
  }
}
