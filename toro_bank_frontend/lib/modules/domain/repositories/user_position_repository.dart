import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user_position.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class UserPositionRepository {
  Future<Either<UserException, UserPosition>> getPositions(int userId);
}
