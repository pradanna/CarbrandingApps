import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(dateTime);
  }

  static String formatDateTimeFromString(String dateTimeString) {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Convert to local time (GMT+7 for Jakarta/Indonesia)
    DateTime localDateTime = dateTime.toLocal();

    // Format the local DateTime object
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(localDateTime);
  }
}
