import 'package:toro_bank_frontend/modules/infrastructure/models/result_trend_model.dart';

abstract class TrendDataSource {
  Future<List<ResultTrendModel>> getTrends();
}
