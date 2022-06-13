import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_in/widgets/custom_signIn_text_field.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_in/widgets/custombutton.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_up/sign_up.dart';
import 'package:flutter_application_37/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
              MaterialPageRoute(builder: (context) => const MyBottomNavigation()),
            );
          }
        },
        builder: (context, state) {

          return Container(
            margin: const EdgeInsets.fromLTRB(28, 60, 28, 0),
            child: Column(
              children: [
                Image.asset('assets/images/3307.webp'),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Логин'),
                    CustomSignInTextField(
                      hintText: 'Логин',
                      isPrefixIcon: true,
                      isSuffixIcon: false,
                    ),
                    const SizedBox(height: 10),
                    const Text('Пароль'),
                    CustomSignInTextField(
                      hintText: 'Пароль',
                      isPrefixIcon: false,
                      isSuffixIcon: true,
                    ),
                    CustomButton(
                      isTextButton: true,
                      onTap: () => authBloc.add(GetSignInEvent()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'У вас еще нет аккаунта?' + ' ',
                      style: TextStyle(fontSize: 14 ,color:  Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const SignUpScreen()),
                          ),
                        );
                      },
                      child: Text(
                        'Создать',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
