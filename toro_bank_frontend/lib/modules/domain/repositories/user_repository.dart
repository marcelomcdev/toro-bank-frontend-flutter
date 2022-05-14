import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/errors.dart';

abstract class UserRepository {
  Future<Either<UserException, User>> getByCpf(String cpf);
  Future<Either<UserException, User>> getById(int id);
}
