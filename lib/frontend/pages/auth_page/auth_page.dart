import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/blocs/auth_bloc/authentication_bloc.dart';
import 'package:shop_app/frontend/pages/login_page/login_page.dart';
import 'package:shop_app/frontend/pages/register_page/register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is RegistrationPageState) {
          return RegisterPage(state: state);
        }
        if (state is AuthPageState) {
          return LoginPage(state: state);
        }
        
        return const SizedBox();
      },
    );
  }
}
