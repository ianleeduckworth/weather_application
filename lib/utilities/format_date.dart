import 'package:intl/intl.dart';

/// Formats a date such that it is human readable
String formatDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('M-d-yyyy').format(dateTime);
  return formattedDate;
}
