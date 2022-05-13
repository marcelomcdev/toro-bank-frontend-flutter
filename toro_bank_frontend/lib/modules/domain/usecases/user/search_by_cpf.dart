import 'package:toro_bank_frontend/modules/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class SearchByCPF {
  Future<Either<UserException, List<User>?>?> call(String cpf);
}

class SearchByCPFImpl implements SearchByCPF {
  @override
  Future<Either<UserException, List<User>?>?> call(String cpf) async {
    //throw '';
    return null;
  }
}
