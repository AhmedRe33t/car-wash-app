 class ProfileState {}
final class ProfileInitial extends ProfileState {}
final class GetProfileDataLoading extends ProfileState {}
final class GetProfileDataSuccess extends ProfileState {}
final class GetProfileDataFaluire extends ProfileState {
  final String errorMassge;
  GetProfileDataFaluire({required this.errorMassge});
}


