import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/blocs/auth_bloc/authentication_bloc.dart';
import 'package:shop_app/frontend/pages/main_page/main_page.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc()..add(RegistrationPageEvent()),
        ),
      ],
      child:  MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}
