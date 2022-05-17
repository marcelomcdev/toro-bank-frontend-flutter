import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

abstract class TrendRepository {
  Future<Either<TrendException, List<Trend>>> getAll();
  Future<Either<TrendException, Trend>> getById(int id);
}
