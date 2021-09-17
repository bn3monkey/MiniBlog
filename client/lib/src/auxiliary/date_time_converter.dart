class DateTimeConverter {
  static String convert(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    String hour = date.hour.toString();
    String minute = date.minute.toString();
    return "${year}-${month.padLeft(2, '0')}-${day.padLeft(2, '0')} ${hour.padLeft(2, '0')}-${minute.padLeft(2, '0')}";
  }
}
