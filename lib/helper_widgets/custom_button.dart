import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
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

  CustomButton(
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
        this.borderColor=Colors.transparent
      });

 static const Color blueColor=Color(0xFF29489C);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularBorder),
            side: BorderSide(color: borderColor)
          )
        ),
        onPressed: onTap,
        child: Text(text!,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: textColor,),),
      ),
    );
  }
}
