import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/positions.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_position.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_position_repository.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/user_position_datasource.dart';

class UserPositionRepositoryImpl implements UserPositionRepository {
  final UserPositionDataSource dataSource;

  UserPositionRepositoryImpl(this.dataSource);

  @override
  Future<Either<UserPositionException, UserPosition>> getPositions(
      int id) async {
    try {
      final result = await dataSource.getPositions(id);
      List<Positions> positions = result.positions!.cast<Positions>().toList();

      UserPosition u = UserPosition(
          result.checkingAccountAmount, result.consolidated, result.investments,
          positions: positions);
      return Right(u);
    } on UserPositionDataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UserPositionDataSourceError('Erro: Id inválida!'));
    }
  }
}
