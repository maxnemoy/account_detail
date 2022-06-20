import 'package:intl/intl.dart';

extension DoubleFormatter on double {
  String toFormattedString() {
    NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
    return numberFormat.format(this);
  }
}
