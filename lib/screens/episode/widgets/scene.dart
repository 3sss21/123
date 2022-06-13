
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Scene extends StatelessWidget {
  final String imgUrl;
  final String titleOfEpisode;
  final String dateOfEpisode;
  final String episode;
  final String? describtion;
  const Scene({
    required this.titleOfEpisode,
    required this.dateOfEpisode,
    required this.episode,
    this.describtion,
    required this.imgUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 80.h,
        width: 343.w,
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              child: Image.asset("assets/images/rick.png"),
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode,
                  style: TextStyle(fontSize: 10.sp, color: Color(0xff22A2BD)),
                ),
                Text(
                  titleOfEpisode,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  dateOfEpisode,
                  style: TextStyle(
                      color: Color(
                        0xff828282,
                      ),
                      fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

