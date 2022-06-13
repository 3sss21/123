part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationFetchedState extends LocationState {
  final List<LocationModel> model;
  
  LocationFetchedState({required this.model, });
}

class LocationLoadingState extends LocationState {}


class LocationErrorState extends LocationState {
   final CatchException error;
 LocationErrorState({required this.error});
}