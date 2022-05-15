import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/user_datasource.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';

extension on String {
  normalize() {
    return replaceAll(" ", "+");
  }
}

class UserResponseDataSource implements UserDataSource {
  final Dio dio;
  UserResponseDataSource(this.dio);
  String genericError = "Erro ao retornar usuário";
  var nullValue;

  // ignore: non_constant_identifier_names
  Future<bool> IsValidResponse(Response<dynamic> response) async {
    return (response != nullValue && response.statusCode == 200);
  }

  var kUrlBase = '';
  var uri = Uri(path: 'http://10.0.2.2:5025/user');

  @override
  Future<ResultUserModel> getUser(int id) async {
    var body = jsonEncode({"id": id});

    final response = await dio.post('http://10.0.2.2:5025/user', data: body);

    if (await IsValidResponse(response)) {
      var user = ResultUserModel.fromMap(response.data);
      return user;
    } else {
      throw DataSourceError("$genericError!");
    }
  }

  @override
  Future<ResultUserModel> getUserByCpf(String cpf) async {
    var body = jsonEncode({"cpf": cpf});
    final response = await dio.post('https://localhost:7025/user/', data: body);
    if (await IsValidResponse(response)) {
      var user = ResultUserModel.fromMap(response.data);
      return user;
      // final list = (response.data as List)
      //     .map((e) => ResultUserModel.fromMap(e))
      //     .toList();
      // var firstItem = list.where((element) => element.cpf == cpf).first;
      // return firstItem;
    } else {
      throw DataSourceError("$genericError por cpf!");
    }
  }

  @override
  Future<List<ResultUserModel>> getList(String cpf) async {
    final response = await dio.get('https://localhost:7025/user'.normalize());
    if (await IsValidResponse(response)) {
      final list = (response.data as List)
          .map((e) => ResultUserModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DataSourceError("$genericError por cpf!");
    }
  }
}
