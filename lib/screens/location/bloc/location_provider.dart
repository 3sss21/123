import 'package:dio/dio.dart';
import 'package:flutter_application_37/helper/api_requester.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';
import 'package:flutter_application_37/models/location.dart';

class PlanetProvider {
  Future<List<LocationModel>> getPlanet() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.get('/location');
      if (response.statusCode == 200) {
        List<LocationModel> characterModelList = response.data["results"]
            .map<LocationModel>((el) => LocationModel.fromJson(el))
            .toList();
        
        return characterModelList;}
//       }  if (response.statusCode == 200) {
// List<CharacterModel> residentsList = response.data["residents"]
//             .map<CharacterModel>((el) => CharacterModel.fromJson(el))
//             .toList();
//             return residentsList;
//       }
      
      
      else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
