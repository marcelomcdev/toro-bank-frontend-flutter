import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class AuthRepository {
  Future<Either<UserException, User?>> AuthUser(String email, String password);
}
