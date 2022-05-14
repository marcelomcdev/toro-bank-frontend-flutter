import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';

import '../../../utils/user_response.dart';
import '../mocks/dio_mock.dart';

main() {
  final dio = DioMock();
  final datasource = UserResponseDataSource(dio);

  test('deve completar se o código for 200', () async {
    var id = 1;

    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(userResult), statusCode: 200, requestOptions: null));

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, completes);
  });

  test('retorna um erro se o código não for 200', () async {
    var id = 1;
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: null, statusCode: 400, requestOptions: null));

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar um erro setiver erro no dio', () async {
    var id = 1;
    when(dio.get(any)).thenThrow(Exception());

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, throwsA(isA<Exception>()));
  });
}
