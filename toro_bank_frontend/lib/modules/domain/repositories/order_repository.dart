import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class OrderRepository {
  Future<Either<OrderException, int>> submitOrder(
      int userId, String symbol, int amount);
}
