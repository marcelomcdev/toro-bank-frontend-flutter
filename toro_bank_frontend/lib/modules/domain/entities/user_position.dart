import 'package:toro_bank_frontend/modules/domain/entities/position.dart';

class UserPosition {
  final List<Position> positions;
  final double checkingAccountAmount;
  final double consolidated;
  final double investments;

  UserPosition(
    this.positions,
    this.checkingAccountAmount,
    this.consolidated,
    this.investments,
  );
}
