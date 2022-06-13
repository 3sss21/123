import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/person/widgets/getStatusColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPerson extends StatelessWidget {
  final String name;
  final String? isLive;
  final String? isMan;
  final String imgPerson;

  MainPerson({
    required this.imgPerson,
    this.isMan,
    required this.name,
    this.isLive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 50.r,
            backgroundImage: NetworkImage(imgPerson),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            isLive!,
            style: TextStyle(color: getStatusColor(isLive!)),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          Text(
            "Человек, ${isMan}",
            style: TextStyle(color: Color.fromARGB(255, 121, 117, 117)),
          ),
        ],
      ),
    );
  }
}
