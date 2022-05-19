import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_position_model.dart';

abstract class UserPositionDataSource {
  Future<ResultUserPositionModel> getPositions(int id);
}
