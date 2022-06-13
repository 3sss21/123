import 'package:flutter_application_37/models/character.dart';
import 'package:flutter_application_37/screens/person/bloc/character_provider.dart';

class PersonRpepository{
  Future<List<CharacterModel>> getPerson(){
    PersonProvider provider = PersonProvider();
    return provider.getPerson();
  }
}