import 'package:intl/intl.dart';

extension NumExtension on DateTime? {
  String formatMMMddYYYY() {
    if(this == null) return '';
    final formattedDate = DateFormat('MMMM dd, yyyy').format(this!);
    return formattedDate;
  }
}
