import 'package:intl/intl.dart';

class DateHelper {
  /// Converting [String] to return a formatted time
  /// of day, month, hour with am or pm
  // e.g from 2021-02-01 to 19 Aug 2021
  static String getDateInWords(dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime).toString();
  }
}
