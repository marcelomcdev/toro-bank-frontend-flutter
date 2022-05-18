import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_position.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_position_repository.dart';

abstract class GetPositions {
  Future<Either<UserPositionException, UserPosition>> call(int userId);
}

class GetPositionsImpl implements GetPositions {
  final UserPositionRepository repository;
  GetPositionsImpl(this.repository);

  @override
  Future<Either<UserPositionException, UserPosition>> call(int userId) async {
    return repository.getPositions(userId);
  }
}
