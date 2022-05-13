import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/errors.dart';

abstract class UserRepository {
  Future<Either<UserException, List<User>?>?> getByCpf(String cpf);
}
