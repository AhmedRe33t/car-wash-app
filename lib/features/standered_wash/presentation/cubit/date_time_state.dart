
sealed class DateTimeState {}

final class DateTimeInitial extends DateTimeState {}

final class AddDateAndTimeLoading extends DateTimeState {}
final class AddDateAndTimeSuccess extends DateTimeState {}
final class AddDateAndTimeFaluire extends DateTimeState {
  final String errorMassage;
  AddDateAndTimeFaluire({required this.errorMassage});
}

final class GeyDateAndTimeLoadint extends DateTimeState {}
final class GetDateAndTimeSuccess extends DateTimeState {}
final class GetDateAndTimeFaluire extends DateTimeState {
  final String errorMassage;
  GetDateAndTimeFaluire({required this.errorMassage});
}



