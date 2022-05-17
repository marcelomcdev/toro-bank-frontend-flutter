// ignore_for_file: prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
//import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';
import 'package:toro_bank_frontend/modules/infrastructure/repositories/user_repository_impl.dart';

import '../mocks/user_data_source_mock.dart';

main() {
  final datasource = UserDataSourceMock();
  final repository = UserRepositoryImpl(datasource);
  final user =
      ResultUserModel(1, "Marcelo Martins de Castro", 300123, "45358996060", 0);
  var nullValue;
  var any;
  test('deve retornar um usuario', () async {
    int id = 1;
    when(() => datasource.getUser(id)).thenAnswer((_) async => user);
    final result = await repository.getById(id);
    expect(result, isA<Right>());
    //expect(result | nullValue, isA<ResultUserModel>());
  });

  test('deve retornar um DataSourceError se o datasource falhar', () async {
    when(() => datasource.getUser(0)).thenThrow(Exception());
    final result = await repository.getById(0);
    expect(result.fold((l) => l, (r) => r), isA<DataSourceError>());
  });
}
