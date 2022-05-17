// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:mocktail/mocktail.dart';
//import 'package:mockito/mockito.dart';
import 'package:toro_bank_frontend/modules/infrastructure/datasources/user_datasource.dart';

class UserDataSourceMock extends Mock implements UserDataSource {}
