import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';


class CustomUploadingWidget extends StatelessWidget {
  final String suggestionText;
   CustomUploadingWidget({this.suggestionText=""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 12.0,bottom: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.check_mark, color: bgColor, size: 15.0),
          SizedBox(width: 12.0,),
          Expanded(child: Text(
            suggestionText, style:TextStyle(color: lightBlackColor,fontSize: 11.0,height: 1.2),))
        ],
      ),
    );
  }
}
