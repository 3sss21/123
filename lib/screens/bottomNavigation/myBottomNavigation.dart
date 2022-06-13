
import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_application_37/screens/episode/epsiode_screen.dart';
import 'package:flutter_application_37/screens/location/location.dart';
import 'package:flutter_application_37/screens/location/widgets.dart';
import 'package:flutter_application_37/screens/person/person_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
 setState(() {
        _selectIndex = index;
        print(index);
 });
  }

  List<Widget> _widgetOptions = <Widget>[
    PersonScreen(),
    Location(),
    EpisodesScreen(),
    //  Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 10.0,
        selectedIconTheme: IconThemeData(color: Color(0xff22A2BD)),
        unselectedIconTheme: IconThemeData(color: Color(0xffBDBDBD)),
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Color(0xff22A2BD)),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/persons.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.lightBlue,
              ),
              icon: Image.asset(
                "assets/images/persons.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.gray2,
              ),
              label: "Персонажи"),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/location.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.lightBlue,
              ),
              icon: Image.asset(
                "assets/images/location.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.gray2,
              ),
              label: "Локации",
              ),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/episode.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.lightBlue,
              ),
              icon: Image.asset(
                "assets/images/episode.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.gray2,
              ),
              label: "Эпизоды",
              ),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/setting.png",
                color: ThemeHelper.lightBlue,
                height: 30.h,
                width: 30.w,
              ),
              icon: Image.asset(
                "assets/images/setting.png",
                height: 30.h,
                width: 30.w,
                color: ThemeHelper.gray2,
              ),
              label: "Настройки",),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
