import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/text_styles.dart';
import 'custom_button.dart';


class ProfileBottomSheet extends StatelessWidget {
  final String sureToDelText;
  final Widget precautionsWidget;
  final Function() delOnTap;
   ProfileBottomSheet({required this.sureToDelText, required this.precautionsWidget, required this.delOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      // height: 340.0,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                      "Are you sure you want to delete this account?",
                      style: delStyle,

                    )),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 25.0,
                    color: lightBlackColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Text(
              sureToDelText,
              style: delAccStyle,

            ),
          ),

          precautionsWidget,
          SizedBox(height: 15.0,),
          Divider(),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                verticalMargin: 10.0,
                borderColor: redColor,
                onTap:delOnTap,
                text: "Delete",
                fontSize: 17.0,
                textColor: redColor,
                bgColor: whiteColor,
                fontWeight: FontWeight.w700,
              ),
              CustomButton(
                verticalMargin: 10.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                bgColor: greenColor,
                fontSize: 17.0,
                textColor: whiteColor,
                text: "Cancel",
                fontWeight: FontWeight.w700,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}


class CustomProfileSheetWidget extends StatelessWidget {
  final IconData icon;
  final String titleText;

  CustomProfileSheetWidget({required this.icon, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,color: lightBlackColor,size: 25.0,),
          SizedBox(width: 10.0,),
          Text("$titleText",style:iconStyle,),
        ],
      ),
    );
  }
}


