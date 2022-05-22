// ignore_for_file: prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_bank_frontend/constants.dart';
//import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';

import '../../../utils/single_user_response.dart';
import '../mocks/dio_mock.dart';

main() {
  final dio = DioMock();
  final datasource = UserResponseDataSource(dio);
  var any;
  var nullValue;

  final user =
      ResultUserModel(1, "Marcelo Martins de Castro", 300123, "45358996060", 0);

  RequestOptions requestOptions = RequestOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      baseUrl: kBaseUrl,
      path: '/user');

  test('deve completar se o código for 200', () async {
    var id = 1;
    var body = jsonEncode({"id": id});
    var url = '$kBaseUrl/user';
    requestOptions.path = '/user';

    when(() => dio.post(url, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleUserResult),
        statusCode: 200,
        requestOptions: requestOptions));

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, completes);
  });

  test('retorna um erro se o código não for 200', () async {
    var id = 0;
    var body = jsonEncode({"id": id});
    var url = '$kBaseUrl/user';
    requestOptions.path = '/user';

    when(() => dio.post(url, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleUserResult),
        statusCode: 400,
        requestOptions: requestOptions));

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar um erro se tiver erro no dio', () async {
    var id = 0;
    var body = jsonEncode({"id": 0});
    when(() => dio.post(any, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleUserResult),
        statusCode: 400,
        requestOptions: requestOptions));

    final Future<ResultUserModel> future = datasource.getUser(id);
    expect(future, throwsA(isA<Exception>()));
  });
}
