import 'package:intl/intl.dart';

class FormatHelper {
  String getCurrency(double value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
}
