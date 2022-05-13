import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_repository.dart';

abstract class GetByCPF {
  Future<Either<UserException, List<User>>> call(String cpf);
}

class GetByCPFImpl implements GetByCPF {
  final UserRepository repository;
  GetByCPFImpl(this.repository);

  @override
  Future<Either<UserException, List<User>>> call(String cpf) async {
    if (cpf == null || cpf.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.getByCpf(cpf);
  }
}
