import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/auth_repository.dart';

abstract class AuthUser {
  Future<Either<AuthException, Token?>> call(String email, String password);
}

class AuthUserImpl implements AuthUser {
  final AuthRepository repository;
  AuthUserImpl(this.repository);

  @override
  Future<Either<AuthException, Token?>> call(
      String email, String password) async {
    if (email == '' || password == '') {
      return Left(InvalidCredentialsException());
    }
    return repository.authUser(email, password);
  }
}
