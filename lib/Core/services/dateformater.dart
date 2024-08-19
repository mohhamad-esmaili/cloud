import 'package:intl/intl.dart';

// this class manage dateTimes that sent from api and make it easy to read
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
