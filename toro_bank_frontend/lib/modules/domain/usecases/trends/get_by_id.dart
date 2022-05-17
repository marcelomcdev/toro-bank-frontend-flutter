import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/trend_repository.dart';
import '../../errors/errors.dart';

abstract class GetTrendById {
  Future<Either<TrendException, Trend>> call(int id);
}

class GetTrendByIdImpl implements GetTrendById {
  final TrendRepository repository;
  GetTrendByIdImpl(this.repository);

  @override
  Future<Either<TrendException, Trend>> call(int id) async {
    if (id == 0) {
      return Left(InvalidTrendIdentifierError());
    }
    return repository.getById(id);
  }
}
