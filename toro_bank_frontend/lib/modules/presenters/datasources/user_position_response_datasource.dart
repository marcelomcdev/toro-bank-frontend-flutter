import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/user_position_datasource.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_position_model.dart';

class UserPositionResponseDataSource implements UserPositionDataSource {
  final Dio dio;
  UserPositionResponseDataSource(this.dio);
  String genericError = "Erro ao retornar usuário";
  var nullValue;

  // ignore: non_constant_identifier_names
  Future<bool> IsValidResponse(Response<dynamic> response) async {
    return (response != nullValue && response.statusCode == 200);
  }

  @override
  Future<ResultUserPositionModel> getPositions(int id) async {
    var body = jsonEncode({"id": id});

    final response = await dio.get('$kBaseUrl/userposition/$id');

    if (await IsValidResponse(response)) {
      var user = ResultUserPositionModel.fromJson(response.data);
      return user;
    } else {
      throw UserPositionDataSourceError("$genericError!");
    }
  }
}
