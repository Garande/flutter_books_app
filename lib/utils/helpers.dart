import 'package:intl/intl.dart';

class Helpers {
  static String formatDateMonth(DateTime dateTime) {
    var dateFormat = DateFormat.yMMMEd();
    return dateFormat.format(dateTime);
  }
}
