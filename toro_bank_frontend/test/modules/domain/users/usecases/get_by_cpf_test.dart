import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/user/get_by_cpf.dart';

import '../mocks/user_repository_mock.dart';

main() {
  final repository = UserRepositoryMock();
  final useCase = GetByCPFImpl(repository);
  const String cpf = "01255544455";
  final User user = User(1, 'Marcelo', 300123, '123456789101', 0);

  setUp(() => {});

  test('should return an user', () async {
    when(() => repository.getByCpf(cpf)).thenAnswer((_) async => Right(user));
    User? nullValue;
    final result = await useCase(cpf);
    expect(result, isA<Right>());
  });

  test('should return an InvalidTextError if cpf is invalid', () async {
    when(() => repository.getByCpf(cpf)).thenAnswer((_) async => Right(user));
    var result = await useCase('');
    expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());
    result = await useCase("");
    expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());
  });
}
