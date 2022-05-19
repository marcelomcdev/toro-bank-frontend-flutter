import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/order_repository.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/order_datasource.dart';

class UserRepositoryImpl implements OrderRepository {
  final OrderDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<OrderException, String>> submitOrder(
      int userId, String symbol, int amount) async {
    try {
      final result = await dataSource.submitOrder(userId, symbol, amount);
      return Right(result);
    } on OrderDataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(OrderDataSourceError('Erro: Dados de pedido inválidos!'));
    }
  }
}
