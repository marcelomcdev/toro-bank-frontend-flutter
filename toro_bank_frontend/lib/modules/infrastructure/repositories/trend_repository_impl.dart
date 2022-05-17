import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';

import 'package:dartz/dartz.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/trend_repository.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/trend_datasource.dart';

class TrendRepositoryImpl implements TrendRepository {
  final TrendDataSource dataSource;

  TrendRepositoryImpl(this.dataSource);

  @override
  Future<Either<TrendException, List<Trend>>> getAll() async {
    try {
      final result = await dataSource.getTrends();
      return Right(result);
    } catch (e) {
      return Left(TrendDataSourceError(
          'Erro ao carregar ativos mais comercializados.'));
    }
  }

  @override
  Future<Either<TrendException, Trend>> getById(int id) async {
    try {
      final result = await dataSource.getTrends();
      final trend = result.where((element) => element.id == id).first;

      return Right(trend);
    } on TrendDataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(TrendDataSourceError('Erro: Id inválida!'));
    }
  }
}
