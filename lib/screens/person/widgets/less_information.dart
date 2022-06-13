
import 'package:flutter/material.dart';

class Less_information extends StatelessWidget {
  bool ?isLogo;
  final String describetion;
   Less_information({
     required this.describetion,
    this.isLogo=true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(describetion, style: TextStyle(fontSize: 14, color: Color(0xff828282)),),
        Icon(Icons.qr_code_2_outlined, color: Color(0xff828282),)
      ],
    );
  }
}
