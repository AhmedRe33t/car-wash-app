class DateAndTime{
  final String date;
  final String time;

  DateAndTime({required this.date, required this.time});
  factory DateAndTime.fromJson(jsonData){
    return DateAndTime(
      date: jsonData['date']
    , time: jsonData['time']);
  }
  
}