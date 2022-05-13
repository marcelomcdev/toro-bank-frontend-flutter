import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

import 'package:toro_bank_frontend/modules/domain/entities/user.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<UserException, List<User>>> getByCpf(String cpf) {
    // TODO: implement getByCpf
    throw UnimplementedError();
  }

  @override
  Future<Either<UserException, User>> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
