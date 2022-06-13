part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterFetchedState extends CharacterState {
  final List<CharacterModel> model;
  CharacterFetchedState({required this.model});
}

class PersonLoadingState extends CharacterState {}


class PersonErrorState extends CharacterState {
   final CatchException error;
   PersonErrorState({required this.error});
}