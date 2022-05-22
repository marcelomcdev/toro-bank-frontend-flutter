import 'package:toro_bank_frontend/modules/domain/entities/token.dart';

abstract class AuthUserDataSource {
  Future<Token?> authUser(String email, String password);
  Future<int> getIdByToken(String token);
}
