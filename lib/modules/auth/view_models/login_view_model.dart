import 'package:flutter/material.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';

class LoginViewModel extends ViewModel {
  final TextEditingController usernameController = TextEditingController();
  get username => usernameController.text;

  final TextEditingController passwordController = TextEditingController();
  get password => passwordController.text;
}