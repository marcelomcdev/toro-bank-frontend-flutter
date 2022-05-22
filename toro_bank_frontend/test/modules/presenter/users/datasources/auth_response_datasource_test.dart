import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_bank_frontend/constants.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/auth_response_datasource.dart';

import '../../../utils/single_auth_token.dart';
import '../mocks/dio_mock.dart';

void main() {
  final dio = DioMock();
  final datasource = AuthUserResponseDataSource(dio);
  var any;
  var nullValue;
  var email = 'marcelo.castro@gmail.com';
  var password = '123456';

  RequestOptions requestOptions = RequestOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      baseUrl: kBaseUrl,
      path: '/user');

  final user =
      ResultUserModel(1, "Marcelo Martins de Castro", 300123, "45358996060", 0);

  test('should pass if response status equals 200', () async {
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    var url = '$kBaseUrl/auth';
    requestOptions.path = '/auth';

    when(() => dio.post(url, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleAuthToken),
        statusCode: 200,
        requestOptions: requestOptions));

    final Future<Token?> future = datasource.authUser(email, password);
    expect(future, completes);
  });

  test('should return an AuthDataSourceError if password is empty', () async {
    email = 'marcelo.castro@gmail.com';
    password = '';
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    var url = '$kBaseUrl/auth';
    requestOptions.path = '/auth';

    when(() => dio.post(url, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleAuthToken),
        statusCode: 400,
        requestOptions: requestOptions));

    final Future<Token?> future = datasource.authUser(email, password);
    expect(future, throwsA(isA<AuthDataSourceError>()));
  });

  test('should return an AuthDataSourceError if username is empty', () async {
    email = '';
    password = '123456';
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    var url = '$kBaseUrl/auth';
    requestOptions.path = '/auth';

    when(() => dio.post(url, data: body)).thenAnswer((_) async => Response(
        data: jsonDecode(singleAuthToken),
        statusCode: 400,
        requestOptions: requestOptions));

    final Future<Token?> future = datasource.authUser(email, password);
    expect(future, throwsA(isA<AuthDataSourceError>()));
  });
}
