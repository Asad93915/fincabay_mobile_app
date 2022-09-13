import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBrowsPropertyWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final bool selectedColor;
  final Function()? onTap;

  CustomBrowsPropertyWidget(
      {this.icon, this.title = '', this.selectedColor = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: selectedColor == true ? bgColor : blackColor,
              ),
              SizedBox(width: 5.0),
              Text(
                title,
                style: TextStyle(
                    color: selectedColor == true ? bgColor : blackColor,
                    fontSize: 14.0,
                    height: 1.5,
                    fontWeight: selectedColor == true
                        ? FontWeight.w500
                        : FontWeight.normal),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          height: 4.0,
          width: 80.0,
          decoration: BoxDecoration(
              color: selectedColor == true ? bgColor : Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0))),
        ),
      ],
    );
  }
}

class CustomTypeWidget extends StatelessWidget {

  final String title;
  final bool selectedColor;
  final Function()? onTap;

  CustomTypeWidget(
      { this.title = '', this.selectedColor = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color:
                selectedColor == true ? Colors.blue[100] : Colors.transparent),
        child: TextButton(
            onPressed: onTap,
            child: Text(
              title,
              style:
                  TextStyle(color: selectedColor ==true ? bgColor : blackColor),
            )));
  }
}
