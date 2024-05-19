import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users {
  //controllers
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //user registration
  Future<void> signUp() async {
    if (passwordConfirm() &&
        emailController.text.trim() != '' &&
        passwordController.text.trim() != '' &&
        confirmPasswordController.text.trim() != '') {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirm() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //авторизация
  Future signIn() async {
    if (emailController.text.trim() == '' ||
        passwordController.text.trim() == '') {
      return;
    } else {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  //выход из приложения
  Future<void> signAppOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
