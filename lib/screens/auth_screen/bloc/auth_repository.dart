import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/auth_screen/bloc/auth_provider.dart';

class AuthRpepository{
  createUser({
    required String lastname,
required String firstname,
required String patronymic,
required String username,
    required String password,
  }){
      AuthProvider provider  = AuthProvider();
  provider.creatUser()
  }

  }
