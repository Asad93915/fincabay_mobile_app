import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItemCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  bool selctedColor;

  DrawerItemCard(
      {this.title = '', this.icon, this.onTap, this.selctedColor = false});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 6.0,bottom: 0.0,right: 12.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: selctedColor == true ? drawerColor : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)
          )),
      child: ListTile(

        leading: Icon(
          icon,
          color: selctedColor == true ? bgColor : lightBlackColor,
        ),
        title: Text(
          title!,
          style: TextStyle(
              color: selctedColor == true ? bgColor : lightBlackColor,
              fontSize: 15.0),
        ),
        onTap: onTap,
      ),
    );
  }
}
