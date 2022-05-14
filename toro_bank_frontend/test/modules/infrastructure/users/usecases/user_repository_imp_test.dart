import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';
import 'package:toro_bank_frontend/modules/infrastructure/repositories/user_repository_impl.dart';

import '../mocks/user_data_source_mock.dart';

main() {
  final datasource = UserDataSourceMock();
  final repository = UserRepositoryImpl(datasource);
  final user = ResultUserModel(1, "Marcelo", 300123, "123456789101", 0);
  test('deve retornar um usuario', () async {
    when(datasource.getUser(any)).thenAnswer((_) async => user);
    final result = await repository.getById(1);
    expect(result | null, isA<ResultUserModel>());
  });

  test('deve retornar um DataSourceError se o datasource falhar', () async {
    when(datasource.getUser(any)).thenThrow(Exception());
    final result = await repository.getById(1);
    expect(result.fold((l) => l, (r) => r), isA<DataSourceError>());
  });
}
