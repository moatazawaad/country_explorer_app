import 'package:intl/intl.dart';


class IntUtils {
  static String formatInt(int? population) {
    if (population == null) {
      return 'N/A';
    }

    final formatter = NumberFormat('#,###,###');
    return formatter.format(population);
  }
}