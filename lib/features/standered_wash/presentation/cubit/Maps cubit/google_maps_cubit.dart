import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsState> {
  Position? position;
  late final Completer<GoogleMapController> mapController;
  LatLng? selectedLocation;
  Marker? selectedMarker;
  GoogleMapsCubit() : super(GoogleMapsInitial()) {
    mapController = Completer();
    _initializePosition();
  }

  Future<void> _initializePosition() async {
    try {
      emit(GoogleMapsLoading());
      position = await detectCurrentLocation();
      emit(GoogleMapsSuccess(position!, selectedMarker: null));  // No marker initially
    } catch (e) {
      emit(GoogleMapsError(e.toString()));
    }
  }

  Future<Position> detectCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled. Please enable GPS.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied. Please enable them from settings.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> goToMyCurrentLocation() async {
    if (position != null) {
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position!.latitude, position!.longitude),
          zoom: 17,
        ),
      ));
    }
  }

  // Handle map tap and add marker
  void updateSelectedLocation(LatLng location) {
    selectedLocation = location;
    selectedMarker = Marker(
      markerId: const MarkerId('selected_location'),
      infoWindow: InfoWindow(title: 'your location', snippet: '$position'),
      position: location,
    );
    emit(GoogleMapsSuccess(position!, selectedMarker: selectedMarker));
  }
}
