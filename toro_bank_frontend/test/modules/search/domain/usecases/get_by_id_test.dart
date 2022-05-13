// ignore_for_file: avoid_types_as_parameter_names

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/user/get_by_id.dart';
import '../mocks/user_repository_mock.dart';

main() {
  final repository = UserRepositoryMock();
  final useCase = GetByIdImpl(repository);
  const id = 1;
  final User user = User(
      1, 'Marcelo', '300123', '123456789101', 0, 'marcelo.castro', '123456');
  test('deve retornar um usuario', () async {
    when(repository.getById(id)).thenAnswer((_) async => Right(user));
    final result = await useCase(id);
    expect(result, isA<Right>());
  });

  test('deve retornar null se nao houver usuario', () async {
    int idNotFound = 0;
    // ignore: prefer_typing_uninitialized_variables
    var emptyValue;
    when(repository.getById(idNotFound))
        .thenAnswer((_) async => Right(emptyValue));
    var result = await useCase(null);
    expect(result, null);
  });
}
