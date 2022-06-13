part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeFetchedState extends EpisodeState {
  final List<EpisodeModel> model;
  EpisodeFetchedState({required this.model});
}

class EpsiodeLoadingState extends EpisodeState {}


class EpisodeErrorState extends EpisodeState {
   final CatchException error;
   EpisodeErrorState({required this.error});
}