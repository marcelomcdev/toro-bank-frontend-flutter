// ignore_for_file: prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
//import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/app_module.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_repository.dart';

import 'presenter/users/mocks/dio_mock.dart';
import 'utils/user_response.dart';

main() {
  final dio = DioMock();
  var any;
  var nullValue;
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('should get use case withou error', () {
    final usecase = Modular.get<UserRepository>();
    expect(usecase, isA<UserRepository>());
  });

  test('should get an user', () async {
    var id = 1;

    when(() => dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(userResult),
        statusCode: 200,
        requestOptions: nullValue));

    final usecase = Modular.get<UserRepository>();
    final result = await usecase.getById(id);
    expect(result | nullValue, isA<User>());
    expect(usecase, isA<UserRepository>());
  });
}
