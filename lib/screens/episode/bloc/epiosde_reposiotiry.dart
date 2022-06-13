import 'package:flutter_application_37/models/epsiode.dart';
import 'package:flutter_application_37/screens/episode/bloc/episode_provider.dart';

class EpisodeRepository{
  Future<List<EpisodeModel>> getPerson(){
    EpisodeProvider provider = EpisodeProvider();
    return provider.getPerson();
  }
}