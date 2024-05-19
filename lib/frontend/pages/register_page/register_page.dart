import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/blocs/auth_bloc/authentication_bloc.dart';
import 'package:shop_app/frontend/components/text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
    required this.state,
  });

  final RegistrationPageState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Регистрация',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              //поле для ввода имени
              TextFieldWidget(
                top: const Radius.circular(20),
                bottom: const Radius.circular(7),
                controller: state.users.nameController,
                labelText: 'Введите Имя',
              ),
              const SizedBox(height: 7),
              //поле для ввода фамилии
              TextFieldWidget(
                top: const Radius.circular(7),
                bottom: const Radius.circular(7),
                controller: state.users.lastNameController,
                labelText: 'Введите фамилию',
              ),
              const SizedBox(height: 7),
              //поле для ввода почты
              TextFieldWidget(
                top: const Radius.circular(7),
                bottom: const Radius.circular(7),
                controller: state.users.emailController,
                labelText: 'Введите Email',
              ),
              const SizedBox(height: 7),
              //поле для ввода пароля
              TextFieldWidget(
                top: const Radius.circular(7),
                bottom: const Radius.circular(7),
                controller: state.users.passwordController,
                labelText: 'Введите пароль',
                isShown: true,
              ),
              const SizedBox(height: 7),
              //поле для ввода пароля повторно
              TextFieldWidget(
                top: const Radius.circular(7),
                bottom: const Radius.circular(20),
                controller: state.users.confirmPasswordController,
                labelText: 'Введите повторно пароль',
                isShown: true,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(AuthPageEvent());
                  },
                  child: const Text(
                    'Есть аккаунт? Авторизуйтесь',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                child: FloatingActionButton(
                  onPressed: () {
                    state.signUpUser();
                  },
                  child: const Text('Регистрация'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
