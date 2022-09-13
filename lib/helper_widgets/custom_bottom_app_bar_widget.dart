
import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBarWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;
  final bool selectedItemColor;
  CustomBottomAppBarWidget({required this.icon, required this.label, this.onTap, this.selectedItemColor=false});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      splashColor: lightBlackColor,
      borderRadius: BorderRadius.circular(80.0),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            Icon(icon,color: selectedItemColor==true?bgColor:blackColor,),
            Text(label,style: TextStyle(fontSize: 14.0,color: selectedItemColor==true?bgColor:blackColor),)
          ],
        ),
      ),
    );
  }
}
