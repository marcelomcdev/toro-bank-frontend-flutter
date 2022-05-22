import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/auth_user_datasource.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_token_model.dart';

class AuthUserResponseDataSource implements AuthUserDataSource {
  final Dio dio;
  AuthUserResponseDataSource(this.dio);
  var nullValue;
  String genericError = "Erro ao retornar usuário";

  @override
  Future<Token?> authUser(String email, String password) async {
    var body = jsonEncode({"email": email, "password": password});
    final response = await dio.post('$kBaseUrl/auth', data: body);
    if (await IsValidResponse(response)) {
      return ResultTokenModel.fromMap(response.data);
    } else {
      throw AuthDataSourceError(genericError);
    }
  }

  @override
  Future<int> getIdByToken(String token) async {
    var body = jsonEncode({"token": token});
    final response =
        await dio.post('$kBaseUrl/auth/validate-token', data: body);
    if (await IsValidResponse(response)) {
      return response.data;
    } else {
      throw AuthDataSourceError(genericError);
    }
  }

  Future<bool> IsValidResponse(Response<dynamic> response) async {
    return (response != nullValue && response.statusCode == 200);
  }
}
