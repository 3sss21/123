part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class GetSignInEvent extends AuthEvent{}

class GetSignUpEvent extends AuthEvent{}