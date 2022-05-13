// ignore_for_file: overridden_fields

import '../../domain/entities/user.dart';
import 'dart:convert';

class ResultUserModel extends User {
  ResultUserModel(int id, String name, String accountNumber, String cPF,
      double balance, String userName, String password)
      : super(id, name, accountNumber, cPF, balance, userName, password);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'accountNumber': accountNumber});
    result.addAll({'cpf': cpf});
    result.addAll({'balance': balance});
    result.addAll({'userName': userName});
    result.addAll({'password': password});

    return result;
  }

  factory ResultUserModel.fromMap(Map<String, dynamic> map) {
    return ResultUserModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['accountNumber'] ?? '',
      map['cpf'] ?? '',
      map['balance']?.toDouble() ?? 0.0,
      map['userName'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultUserModel.fromJson(String source) =>
      ResultUserModel.fromMap(json.decode(source));
}
