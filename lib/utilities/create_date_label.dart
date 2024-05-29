String createDateLabel(String prefix, DateTime dateTime) {
  String day = dateTime.day.toString();
  String month = dateTime.day.toString();
  String year = dateTime.year.toString();
  String hour = dateTime.hour.toString();
  String minutes = dateTime.minute.toString();

  return '$prefix-$day-$month-$year@$hour.$minutes';
}
