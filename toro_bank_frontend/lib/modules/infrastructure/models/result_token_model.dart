import 'dart:convert';

import 'package:toro_bank_frontend/modules/domain/entities/token.dart';

class ResultTokenModel extends Token {
  ResultTokenModel(String accessToken, DateTime expires)
      : super(accessToken, expires);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accessToken': accessToken});
    result.addAll({'expires': expires.millisecondsSinceEpoch});

    return result;
  }

  factory ResultTokenModel.fromMap(Map<String, dynamic> map) {
    return ResultTokenModel(
      map['accessToken'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['expires']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultTokenModel.fromJson(String source) =>
      ResultTokenModel.fromMap(json.decode(source));
}
