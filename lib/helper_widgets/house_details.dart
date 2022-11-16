import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseDetails extends StatelessWidget {
  final IconData? icon;
  final String? title;

  HouseDetails({this.icon, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,size: 15.0,),
        SizedBox(width: 5.0,),
        title==null?SizedBox():Text(title!,style: TextStyle(color: blackColor,fontSize: 12.0,),),
      ],
    ));
  }
}
