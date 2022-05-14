// ignore_for_file: overridden_fields

import '../../domain/entities/user.dart';
import 'dart:convert';

class ResultUserModel extends User {
  ResultUserModel(
      int id, String name, int accountNumber, String cpf, double balance)
      : super(id, name, accountNumber, cpf, balance);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'accountNumber': accountNumber});
    result.addAll({'cpf': cpf});
    result.addAll({'balance': balance});

    return result;
  }

  factory ResultUserModel.fromMap(Map<String, dynamic> map) {
    return ResultUserModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['accountNumber']?.toInt() ?? 0,
      map['cpf'] ?? '',
      map['balance']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultUserModel.fromJson(String source) =>
      ResultUserModel.fromMap(json.decode(source));
}
