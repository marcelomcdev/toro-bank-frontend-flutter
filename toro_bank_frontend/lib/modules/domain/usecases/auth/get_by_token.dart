import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/auth_repository.dart';

abstract class GetIdByToken {
  Future<Either<AuthException, User?>> call(String token);
}

class GetIdByTokenImpl implements GetIdByToken {
  final AuthRepository repository;
  GetIdByTokenImpl(this.repository);

  @override
  Future<Either<AuthException, User?>> call(String token) async {
    if (token == '') {
      return Left(InvalidTokenException());
    }
    return repository.getIdByToken(token);
  }
}
