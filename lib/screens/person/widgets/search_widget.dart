import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  final String titleSearch;
  const Search({Key? key, required this.titleSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Container(
              width: 343.w,
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: Color(0xffF2F2F2)),
              child: Row(
                children: [
                  SizedBox(
                    width: 19.w,
                  ),
                  Icon(
                    Icons.search,
                    color: Color(0xff5B6975),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  SizedBox(
                    width: 235.w,
                    height: 24.h,
                    child:  TextField(
                      decoration: InputDecoration.collapsed(
                       hintText: titleSearch, hintStyle: TextStyle(color: Color(0xffBDBDBD,), fontSize: 16,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 24.sp, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xff5B6975),
                  )
                ],
              ),
            ),
          ],
        );
    
    
  }
}
