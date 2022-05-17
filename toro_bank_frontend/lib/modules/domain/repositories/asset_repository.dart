import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/asset.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class AssetRepository {
  Future<Either<UserException, Asset>> getById(int id);
}
