import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/auth/get_id_by_token.dart';

import '../mocks/auth_repository_mock.dart';

void main() {
  final repository = AuthRepositoryMock();
  final useCase = GetIdByTokenImpl(repository);
  final User user = User(1, 'Marcelo', 300123, '123456789101', 0);
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJqdGkiOiI3ZGFiYjJhYTZmZDI0NDBlOWMwOTBhZTQyNmM0ZGQxYyIsInJvbGUiOiJVc2VyIiwibmJmIjoxNjUzMjIyNzA1LCJleHAiOjE2NTMyMjYzMDUsImlhdCI6MTY1MzIyMjcwNSwiaXNzIjoidG9yby1iYW5rIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAyNSJ9.REE_OSt8v8ViLmgHMh4qbcvANvXMWZK6Jab5zwb-aLQ";
  test('should return an userId eq 1 if have a valid token', () async {
    when(() => repository.getIdByToken(token))
        .thenAnswer((_) async => const Right(1));
    final result = await useCase(token);
    expect(result, isA<Right>());
  });
  test('should have an InvalidTokenException if token is empty', () async {
    when(() => repository.getIdByToken(token))
        .thenAnswer((_) async => const Right(1));
    var result = await useCase('');
    expect(result.fold((l) => l, (r) => r), isA<InvalidTokenException>());
  });
}
