part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class RegistrationPageEvent extends AuthenticationEvent {}

class AuthPageEvent extends AuthenticationEvent {}


