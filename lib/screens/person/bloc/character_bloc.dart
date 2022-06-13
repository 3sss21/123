import 'package:bloc/bloc.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';
import 'package:flutter_application_37/screens/person/bloc/character_repository.dart';
import 'package:meta/meta.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async{
if (event is GetCharacterEvent) {
        try {
          List<CharacterModel> characterModelList = await PersonRpepository().getPerson();
  
          emit(CharacterFetchedState(model: characterModelList));
        } catch (e) {
          emit(PersonErrorState(error:CatchException.convertException(e) ));
        }
      }
    });
    
  }
}
