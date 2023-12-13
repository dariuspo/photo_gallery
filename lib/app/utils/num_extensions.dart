import 'package:intl/intl.dart' as intl;


extension NumExtension on num? {
  String formatNumber() {
    final formatter = intl.NumberFormat.decimalPattern();
    return formatter.format(this);
  }
}
