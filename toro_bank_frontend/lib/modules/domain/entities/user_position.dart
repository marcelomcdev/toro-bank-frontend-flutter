import 'package:toro_bank_frontend/modules/domain/entities/positions.dart';

class UserPosition {
  final List<Positions>? positions;
  final double checkingAccountAmount;
  final double consolidated;
  final double investments;

  UserPosition(this.checkingAccountAmount, this.consolidated, this.investments,
      {this.positions = const []});
}
