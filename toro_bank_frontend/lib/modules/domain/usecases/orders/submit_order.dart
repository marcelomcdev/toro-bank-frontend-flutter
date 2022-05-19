import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/order_repository.dart';

abstract class SubmitOrder {
  Future<Either<OrderException, String>> call(
      int userId, String symbol, int amount);
}

class SubmitOrderImpl implements SubmitOrder {
  late final OrderRepository repository;
  SubmitOrderImpl(this.repository);

  @override
  Future<Either<OrderException, String>> call(
      int userId, String symbol, int amount) async {
    if (userId == 0) {
      return Left(InvalidOrderIdentifierError());
    } else if (symbol == '') {
      return Left(InvalidOrderTextError());
    } else if (amount <= 0) {
      return Left(InvalidOrderAmountError());
    }
    return repository.submitOrder(userId, symbol, amount);
  }
}
