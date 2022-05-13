import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

import 'package:toro_bank_frontend/modules/domain/entities/user.dart';

import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/user_datasource.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<UserException, List<User>>> getByCpf(String cpf) {}

  @override
  Future<Either<UserException, User>> getById(int id) async {
    try {
      final result = await dataSource.getUser(id);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError('Erro: Id inválida!'));
    }
  }
}
