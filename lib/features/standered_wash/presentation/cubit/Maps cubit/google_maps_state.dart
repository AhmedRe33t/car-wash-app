part of 'google_maps_cubit.dart';

@immutable
sealed class GoogleMapsState {}

final class GoogleMapsInitial extends GoogleMapsState {}

final class GoogleMapsLoading extends GoogleMapsState {}

final class GoogleMapsSuccess extends GoogleMapsState {
  final Position position;
  final Marker? selectedMarker;

  GoogleMapsSuccess(this.position, {this.selectedMarker});
}

final class GoogleMapsError extends GoogleMapsState {
  final String error;
  GoogleMapsError(this.error);
}
