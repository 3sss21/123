
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Planets extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitleHeader;


  const Planets({
    required this.imageUrl,
    required this.title,
    required this.subtitleHeader,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              width: 343.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 20.sp),
          ),
          Row(
            children: [
              Text(
                subtitleHeader,
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                width: 4.w,
                height: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Мир",
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 12.sp,
                ),
              ),
          
            ],
          ),
          SizedBox(height: 20,)
        ],
        
      ),
    );
  }
}
