import 'package:flutter_application_37/models/location.dart';
import 'package:flutter_application_37/screens/location/bloc/location_provider.dart';

class PlanetRpepository{
  Future<List<LocationModel>> getPlanet(){
    PlanetProvider provider = PlanetProvider();
    
    return provider.getPlanet();
  }
}