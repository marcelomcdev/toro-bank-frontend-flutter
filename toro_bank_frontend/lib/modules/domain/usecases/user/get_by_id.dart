import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_repository.dart';
import '../../entities/user.dart';
import '../../errors/errors.dart';

abstract class GetById {
  Future<Either<UserException, User>> call(int id);
}

class GetByIdImpl implements GetById {
  final UserRepository repository;
  GetByIdImpl(this.repository);

  @override
  Future<Either<UserException, User>> call(int id) async {
    if (id == 0) {
      return Left(InvalidIdentifierError());
    }
    return repository.getById(id);
  }
}
