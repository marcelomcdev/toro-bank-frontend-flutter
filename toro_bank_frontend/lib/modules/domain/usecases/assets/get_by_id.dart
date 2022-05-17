import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/asset.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/asset_repository.dart';

abstract class GetById {
  Future<Either<UserException, Asset>> call(int id);
}

class GetByIdImpl implements GetById {
  final AssetRepository repository;
  GetByIdImpl(this.repository);

  @override
  Future<Either<UserException, Asset>> call(int id) async {
    if (id == 0) {
      return Left(InvalidIdentifierError());
    }
    return repository.getById(id);
  }
}
