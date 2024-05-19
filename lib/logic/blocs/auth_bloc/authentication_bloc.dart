import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:shop_app/logic/models/users.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<RegistrationPageEvent>(_registrationPageEvent);
    on<AuthPageEvent>(_authPageEvent);
  
  }

  Future<void> _registrationPageEvent(
      RegistrationPageEvent event, Emitter<AuthenticationState> emit) async {
    emit(RegistrationPageState());
  }

  Future<void> _authPageEvent(
      AuthPageEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthPageState());
  }

}
