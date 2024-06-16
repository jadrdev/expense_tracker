// convert DaTeTime object to string yyyymmdd

String convertDateTimeYoString(DateTime datetime) {
  // year in the format yyyy
  String year = datetime.year.toString();
  // month in the format mm
  String month = datetime.month.toString();
  // day in the format dd
  String day = datetime.day.toString();

  // return yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
