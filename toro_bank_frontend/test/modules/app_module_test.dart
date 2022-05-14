import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toro_bank_frontend/app_module.dart';
import 'package:toro_bank_frontend/modules/domain/repositories/user_repository.dart';

main() {
  initModule(AppModule());

  test('deve recuperar o use case sem erro', () {
    final usecase = Modular.get<UserRepository>();
    expect(usecase, isA<UserRepository>());
  });
}
