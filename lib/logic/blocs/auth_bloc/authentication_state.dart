part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {
  final users = Users();
}

final class AuthenticationInitial extends AuthenticationState {}

class RegistrationPageState extends AuthenticationState {
  Future signUpUser() async {
    users.signUp();
  }
}

class AuthPageState extends AuthenticationState {
  Future signInUser() async {
    users.signIn();
  }
}

// class AppSingOutState extends AuthenticationState {
//   Future signOut() async {
//     users.signAppOut();
//   }
// }
