import 'package:bloc/bloc.dart';
import 'package:flutter_application_37/helper/catchException.dart';
import 'package:flutter_application_37/models/character.dart';
import 'package:flutter_application_37/models/epsiode.dart';
import 'package:flutter_application_37/screens/episode/bloc/epiosde_reposiotiry.dart';
import 'package:meta/meta.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeInitial()) {
    on<EpisodeEvent>((event, emit)  async{
if (event is GetEpisodeEvent) {
        try {
          List<EpisodeModel> epsiodeModelList = await EpisodeRepository().getPerson();
  
          emit(EpisodeFetchedState(model: epsiodeModelList));
        } catch (e) {
          emit(EpisodeErrorState(error:CatchException.convertException(e) ));
        }
      }
    }
    );
  }
}
