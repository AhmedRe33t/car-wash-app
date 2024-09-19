// car_cubit_state.dart



abstract class CarTypesState {}

final class CarTypesInitial extends CarTypesState {}

final class GetCarTypesLoading extends CarTypesState {}
final class GetCarTypesSuccess extends CarTypesState {}
final class GetCarTypesFaluire extends CarTypesState {
  final String errorMassege;
  GetCarTypesFaluire({required this.errorMassege});
  
}

final class AddCarTypesLoading extends CarTypesState {}
final class AddCarTypesSuccess extends CarTypesState {}
final class AddCarTypesFaluire extends CarTypesState {
  final String errorMassege;
  AddCarTypesFaluire({required this.errorMassege});}
  



 

  final class BeforeStartPageLoading extends CarTypesState {}

class BeforeStartPageSuccess extends CarTypesState {
  final String selectedCar;

  BeforeStartPageSuccess(this.selectedCar);
}

class BeforeStartPageFailure extends CarTypesState {
  final String error;

  BeforeStartPageFailure(this.error);
}


