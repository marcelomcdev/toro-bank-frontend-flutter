import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/user_response_datasource.dart';

import '../../../utils/user_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = UserResponseDataSource(dio);

  test('retorna um erro se o código não for 200', () async {
    var id = 1;
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: {jsonDecode(userResult)}, statusCode: 200, requestOptions: null));

    final future = await datasource.getUser(id);
    expect(future, completes);
  });
}
