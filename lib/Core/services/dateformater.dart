import 'package:intl/intl.dart';

class DateFormaterService {
  String getThreeDayLetter(String date) =>
      DateFormat('EEEE').format(DateTime.parse(date)).substring(0, 3);

  String getFullDate(String date) =>
      DateFormat().add_yMMMEd().format(DateTime.parse(date));

  String getFullDay(String date) =>
      DateFormat('EEEE').format(DateTime.parse(date));

  String getDayHour(String date) =>
      DateFormat().add_Hm().format(DateTime.parse(date));
}
