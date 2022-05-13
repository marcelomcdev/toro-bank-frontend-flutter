import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';

abstract class UserDataSource {
  Future<ResultUserModel> getUser(int id);
}
