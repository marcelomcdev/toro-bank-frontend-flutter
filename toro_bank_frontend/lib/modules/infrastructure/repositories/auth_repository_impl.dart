import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/auth_repository.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/auth_user_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthUserDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<AuthException, Token?>> authUser(
      String email, String password) async {
    try {
      final result = await dataSource.authUser(email, password);
      return Right(result);
    } on AuthDataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AuthDataSourceError('Usuário ou senha inválidos!'));
    }
  }

  @override
  Future<Either<AuthException, int>> getIdByToken(String token) async {
    try {
      final result = await dataSource.getIdByToken(token);
      return Right(result);
    } on AuthDataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AuthDataSourceError('Token inválido!'));
    }
  }
}
