import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String? initValue;
  final String? headerText;
  final Function(String)?onChange;
  bool isSelected;
  final int? maxLine;
  CustomFormField({this.initValue, this.onChange,this.isSelected=false, this.maxLine, this.headerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText==null?SizedBox(): Padding(
    padding:  EdgeInsets.symmetric(vertical: headerText!.isEmpty ? 0.0:0.0,horizontal:headerText!.isEmpty ? 0.0:8.0 ),
    child: Text(headerText!,style: headerStyle,),
    ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
          height: 45.0,
          child: TextFormField(
            maxLines: maxLine,
            initialValue: initValue,
            onChanged: onChange,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),

              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: lightBlackColor,width: 1.5
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: bgColor,
                      width: 1.5
                  )
              ),

            ),
          ),
        ),
      ],
    );
  }
}