import 'package:intl/intl.dart';

extension DateTimeParsing on DateTime {
  String formatToString({String format = 'dd-MM-yy'}) {
    var newFormat = DateFormat(format);
    return newFormat.format(this);
  }
}
