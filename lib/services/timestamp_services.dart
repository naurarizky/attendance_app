import 'package:intl/intl.dart';

void setDateTime(Function(String, String, String) onDateTimeSet){
  var dateNow = DateTime.now();
  var dateFormat = DateFormat('dd mm yyyy');
  var dateTime = DateFormat('nn:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeSet(date, time, currentDate);
}

void setAttendedStatus(Function(String) onStatusSet){
  var dateNow = DateTime.now();
  var hour = int.parse(DateFormat('hh').format(dateNow));
  var minuite = int.parse(DateFormat('mm').format(dateNow));

  String attendanceStatus;
  if(hour < 7 || (hour == 7 && minuite <= 59)) {
    attendanceStatus = ' Attend';
  } else if (hour > 7 || (hour == 7 && minuite >=01)) {
    attendanceStatus = 'Late';
  } else {
    attendanceStatus = 'Absent';
  }

  onStatusSet(attendanceStatus);
  }