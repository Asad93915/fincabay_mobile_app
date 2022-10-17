import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';

class CustomProfileWidget extends StatelessWidget {
  final IconData? icon;
  final String profileText;
  final bool selectedColor;
  final Function()? onTap;
   CustomProfileWidget({this.icon, required this.profileText,this.selectedColor=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 20.0),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.height * 0.155,
          decoration: BoxDecoration(
            color: selectedColor==true?bgColor:whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: black12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon,size: 30.0,),
              Text(profileText,textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
