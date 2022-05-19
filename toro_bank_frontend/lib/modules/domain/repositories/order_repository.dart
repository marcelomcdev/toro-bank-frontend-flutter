import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class OrderRepository {
  Future<Either<OrderException, String>> submitOrder(
      int userId, String symbol, int amount);
}
