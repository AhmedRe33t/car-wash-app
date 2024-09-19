// ServiceState definitions
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceSelected extends ServiceState {
  final String selectedService;

  ServiceSelected(this.selectedService);
}

class GetPricrsLoading extends ServiceState{}
class GetPricrsSuccess extends ServiceState{}
class GetPricrsFaluer extends ServiceState{
  final String message;
  GetPricrsFaluer({required this.message});
}

class AddPricrsLoading extends ServiceState{}
class AddPricrsSuccess extends ServiceState{}
class AddPricrsFaluer extends ServiceState{
  final String message;
  AddPricrsFaluer({required this.message,});
}

class GetServicesLoading extends ServiceState{}
class GetServicesSuccess extends ServiceState{}
class GetServicesFaluer extends ServiceState{
  final String message;
  GetServicesFaluer({required this.message});
}


class SelectedServices extends ServiceState{
  final String selected;

  SelectedServices({required this.selected});
}