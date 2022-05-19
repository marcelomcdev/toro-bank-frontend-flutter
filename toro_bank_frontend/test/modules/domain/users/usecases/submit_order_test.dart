import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/orders/submit_order.dart';

import '../mocks/order_repository_mock.dart';

main() {
  final repository = OrderRepositoryMock();
  final useCase = SubmitOrderImpl(repository);
  const int userId = 1;
  const String symbol = '';
  const int amount = 3;
  const String response = '';

  test('should return a message', () async {
    when(() => repository.submitOrder(userId, symbol, amount))
        .thenAnswer((_) async => const Right(response));
    final result = await useCase(userId, symbol, amount);
    expect(result, isA<Right>());
  });

  test(
      'should return an InvalidOrderIdentifierError error when user id is invalid',
      () async {
    var _userId = 0;
    when(() => repository.submitOrder(userId, symbol, amount))
        .thenAnswer((_) async => const Right(response));
    final result = await useCase(_userId, symbol, amount);
    expect(result.fold((l) => l, (r) => r), isA<InvalidOrderIdentifierError>());
  });
}
