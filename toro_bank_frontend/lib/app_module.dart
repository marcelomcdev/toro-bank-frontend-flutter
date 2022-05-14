import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toro_bank_frontend/app_widget.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/user/get_by_id.dart';
import 'package:toro_bank_frontend/modules/infrastructure/repositories/user_repository_impl.dart';

import 'modules/domain/usecases/user/get_by_cpf.dart';
import 'modules/presenters/datasources/user_response_datasource.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GetByCPFImpl(i())),
        Bind((i) => GetByIdImpl(i())),
        Bind((i) => UserRepositoryImpl(i())),
        Bind((i) => UserResponseDataSource(i())),
      ];
  @override
  List get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => const AppWidget();
}
