// ignore_for_file: avoid_types_as_parameter_names
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mocktail/mocktail.dart';
//import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/user/get_by_id.dart';
import '../mocks/user_repository_mock.dart';

main() {
  final repository = UserRepositoryMock();
  final useCase = GetByIdImpl(repository);
  const id = 1;
  final User user = User(1, 'Marcelo', 300123, '123456789101', 0);
  test('should return an user', () async {
    when(() => repository.getById(id)).thenAnswer((_) async => Right(user));
    final result = await useCase(id);
    expect(result, isA<Right>());
  });

  test('should return an null value when user is not found', () async {
    int idNotFound = 54;
    when(() => repository.getById(idNotFound))
        .thenAnswer((_) async => const Right(null));
    var result = await useCase(54);
    expect(result, isA<Right>());
  });

  test('should return an InvalidTextError when id is invalid', () async {
    when(() => repository.getById(id)).thenAnswer((_) async => Right(user));
    var result = await useCase(0);
    expect(result.fold((l) => l, (r) => r), isA<InvalidIdentifierError>());
  });
}
