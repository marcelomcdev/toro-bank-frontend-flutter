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

  @override
  Future<ResultUserModel> getUser(int id) async {
    final response =
        await dio.get('https://localhost:7025/user/${id}'.normalize());
    if (response.statusCode == 200) {
      //quando usar lista.
      // final list = (response.data['items'] as List)
      //     .map((e) => ResultUserModel.fromMap(e))
      //     .toList();

      final list = (response.data as List)
          .map((e) => ResultUserModel.fromMap(e))
          .toList();

      var firstItem = list.where((element) => element.id == id).first;
      return firstItem;
    } else {
      throw DataSourceError("Erro ao retornar usuário!");
    }
  }
}
