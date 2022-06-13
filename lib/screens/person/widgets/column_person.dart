
import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnPerson extends StatelessWidget {
  final name;
  final img;
  final String? isLive;
  final String? isMan;
  final rase;
  
  const ColumnPerson({
    required this.rase,
    required this.name,
    required this.img,
    this.isLive,
    this.isMan,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(img),
          maxRadius: 40.r,
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.07,
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isLive!,
             // style: TextStyle(color: getStatusColor(isLive!), fontSize: 14),
            ),
            Text(
              name,
              style: TextHelper.medium14
            ),
            Text("$rase $isMan"),
          ],
        )
      ],
    );
  }
}
