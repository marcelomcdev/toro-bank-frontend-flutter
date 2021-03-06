import 'package:dio/dio.dart' show Dio;
import 'package:flutter/cupertino.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toro_bank_frontend/app_widget.dart';
import 'package:toro_bank_frontend/modules/domain/entities/trend.dart';
import 'package:toro_bank_frontend/modules/domain/usecases/user/get_by_id.dart';
import 'package:toro_bank_frontend/modules/infrastructure/repositories/user_repository_impl.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/home/home_page.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/most-negotiated/most_negotiated_page.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_order.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/purchase/purchase-order/shop/purchase_success.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/sing_in/sign_in_page.dart';

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
  Widget get bootstrap => const AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => const SignInPage()),
        ModularRouter('/home', child: (_, __) => const HomePage()),
        ModularRouter('/mostnegotiated',
            child: (_, __) => const MostNegotiatedAssetPage()),
        ModularRouter('/purchaseorder',
            child: (_, __) => PurchaseOrderPage(
                  trend: Trend(0, '', 0.0, ''),
                )),
        ModularRouter('/purchaseSuccess',
            child: (_, __) => const PurchaseSuccessPage()),
      ];
}
