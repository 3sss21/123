import 'package:dio/dio.dart';
import 'package:flutter_application_37/helper/api_requester.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';

class AuthProvider {
    Future creatUser({
      required  String lastname,
required  String firstname,
required  String patronymic,
required  String username,
required  String password,
    })async{
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.post("", body: {
        "last_name": "",
        "first_name": "",
        "patronymic": "",
        "username": "",
        "password": ""
      });
      if (response.statusCode == 200) {
        // List<CharacterModel> characterModelList = response.data["results"]
        //     .map<CharacterModel>((el) => CharacterModel.fromJson(el))
        //     .toList();
        return "";
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
