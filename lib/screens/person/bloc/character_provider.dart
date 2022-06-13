import 'package:dio/dio.dart';
import 'package:flutter_application_37/helper/api_requester.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';

class PersonProvider {
  Future<List<CharacterModel>> getPerson() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.get('/character');
      if (response.statusCode == 200) {
        List<CharacterModel> characterModelList = response.data["results"]
            .map<CharacterModel>((el) => CharacterModel.fromJson(el)).toList();
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
