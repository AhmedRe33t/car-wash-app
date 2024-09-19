import 'package:carwashing/features/standered_wash/presentation/cubit/Maps%20cubit/google_maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final Function(LatLng) onLocationSelected;

  const MapScreen({super.key, required this.onLocationSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GoogleMapsCubit, GoogleMapsState>(
        builder: (context, state) {
          final googleCubit = context.read<GoogleMapsCubit>();

          if (state is GoogleMapsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is GoogleMapsSuccess) {
            return Stack(
              fit: StackFit.expand,
              children: [
                GoogleMap(
                  compassEnabled: true,
                 
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(state.position.latitude, state.position.longitude),
                    zoom: 17,
                  ),
                  onMapCreated: (controller) {
                    googleCubit.mapController.complete(controller);
                  },
                  markers: googleCubit.selectedMarker != null ? {googleCubit.selectedMarker!} : {},
                  onTap: (LatLng pos) {
                    googleCubit.updateSelectedLocation(pos);
                    onLocationSelected(pos);
                  },
                ),
                Positioned(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 52,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Location',
                              hintStyle: const TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                              prefixIcon: const Icon(Icons.search, color: Colors.blue),
                            ),
                            onChanged: (query) {
                              // Implement search logic here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GoogleMapsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: BlocBuilder<GoogleMapsCubit, GoogleMapsState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () => context.read<GoogleMapsCubit>().goToMyCurrentLocation(),
            backgroundColor: Colors.blue,
            child: const Icon(Icons.place, color: Colors.white),
          );
        },
      ),
    );
  }
}
