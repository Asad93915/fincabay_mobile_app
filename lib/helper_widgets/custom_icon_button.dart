

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final Color textColor;
  final Color bgColor;
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double circularBorder;
  final Color borderColor;
  final IconData? icon;
  final Color iconColor;

  CustomIconButton(
      {this.onTap,
        this.textColor=whiteColor,
        this.text='',
        this.fontSize = 14.0,
        this.fontWeight=FontWeight.normal,
        this.height=45.0,
        this.width=100.0,
        this.horizontalMargin=0.0,
        this.verticalMargin=0.0,
        this.bgColor=blueColor,
        this.circularBorder=10.0,
        this.borderColor=Colors.transparent, this.icon, this.iconColor=whiteColor
      });

  static const Color blueColor=Color(0xFF29489C);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
      child: ElevatedButton.icon(style: ElevatedButton.styleFrom(
          primary:bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularBorder),
              side: BorderSide(color: borderColor)
          )
      ),
        icon: Icon(icon,color: iconColor,),
        onPressed: onTap,
        label: Text(text!,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: textColor,),),)
    );
  }
}

