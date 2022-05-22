import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/infrastructure/models/result_user_model.dart';

abstract class AuthUserDataSource {
  Future<Token?> authUser(String email, String password);
  Future<ResultUserModel> getIdByToken(String token);
}
