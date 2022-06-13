import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_in/widgets/custom_signIn_text_field.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_in/widgets/custombutton.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_up/widgets/custom_text_field.dart';
import 'package:flutter_application_37/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }

          if (state is AuthSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyBottomNavigation()),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Создать аккаунт',
                  style: TextStyle(fontSize: 34, color: Colors.black),
                ),
                const SizedBox(height: 40),
                Text('Имя'),
                CustomSignUpTextField(hintText: 'Имя'),
                Text('Фамилия'),
                CustomSignUpTextField(hintText: 'Фамилия'),
                Text('Отчество'),
                CustomSignUpTextField(hintText: 'Отчество'),
                const Divider(height: 36),
                Text('Логин'),
                CustomSignInTextField(
                  hintText: 'Логин',
                  isPrefixIcon: true,
                  isSuffixIcon: false,
                ),
                Text('Пароль'),
                CustomSignInTextField(
                  hintText: 'Пароль',
                  isPrefixIcon: false,
                  isSuffixIcon: true,
                ),
              
                CustomButton(
                  isTextButton: false,
                  onTap: () => authBloc.add(GetSignUpEvent()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
