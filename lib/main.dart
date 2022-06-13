import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/auth_screen/sign_in/sign_in.dart';
import 'package:flutter_application_37/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:flutter_application_37/screens/episode/Scene.dart';
import 'package:flutter_application_37/screens/location/planet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Episode1(),
      ),
    );
  }
}

