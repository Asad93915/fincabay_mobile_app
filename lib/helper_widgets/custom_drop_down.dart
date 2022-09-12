import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';

class CustomDropDown extends StatelessWidget {
  final Widget? child;
  final Color borderColor;
  CustomDropDown({ this.child,  this.borderColor=lightBlackColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
      height: 45.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
              color: borderColor,width: 1.5
          )
      ),
      child: child,
    );
  }
}
