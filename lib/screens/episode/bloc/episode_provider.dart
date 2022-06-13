import 'package:dio/dio.dart';
import 'package:flutter_application_37/helper/api_requester.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/epsiode.dart';

class EpisodeProvider {
  Future<List<EpisodeModel>> getPerson() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.get('/episode');
      if (response.statusCode == 200) {
        List<EpisodeModel> characterModelList = response.data["results"]
            .map<EpisodeModel>((el) => EpisodeModel.fromJson(el)).toList();
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
