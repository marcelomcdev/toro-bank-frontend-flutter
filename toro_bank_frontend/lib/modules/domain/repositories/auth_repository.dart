import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class AuthRepository {
  Future<Either<AuthException, Token?>> authUser(String email, String password);
  Future<Either<AuthException, User?>> getIdByToken(String token);
}
