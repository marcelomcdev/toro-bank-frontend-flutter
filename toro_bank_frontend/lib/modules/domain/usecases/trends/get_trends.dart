import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/trend_repository.dart';

abstract class GetTrends {
  Future<Either<TrendException, List<Trend>>> call();
}

class GetTrendsImpl implements GetTrends {
  final TrendRepository repository;
  GetTrendsImpl(this.repository);

  @override
  Future<Either<TrendException, List<Trend>>> call() async {
    return repository.getAll();
  }
}
