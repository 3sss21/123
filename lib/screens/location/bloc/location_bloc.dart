import 'package:bloc/bloc.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';
import 'package:flutter_application_37/models/location.dart';
import 'package:flutter_application_37/screens/location/bloc/location_repository.dart';
import 'package:flutter_application_37/screens/person/bloc/character_repository.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async{
if (event is GetLocationEvent) {
        try {
          List<LocationModel> locationModelList = await PlanetRpepository().getPlanet();
       
  
          emit(LocationFetchedState(model: locationModelList, ));
        } catch (e) {
          emit(LocationErrorState(error:CatchException.convertException(e) ));
        }
      }
    });
  }
}
