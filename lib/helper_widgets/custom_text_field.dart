import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? headerText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? prefixOnTap;
  final Function()? suffixOnTap;
  final bool obscureText;
  final int maxLine;
  final int? charLength;

  CustomTextField({
    this.headerText = '',
    this.controller,
    this.focusNode,
    this.inputType,
    this.inputAction,
    this.onChange,
    this.onSubmit,
    this.hintText = '',
    this.labelText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixOnTap,
    this.suffixOnTap,
    this.maxLine=1,
    this.charLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText!.isEmpty ? SizedBox(
          height: 0.0,
        ) : Padding(
          padding:  EdgeInsets.symmetric(vertical: headerText!.isEmpty ? 0.0:0.0,horizontal:headerText!.isEmpty ? 0.0:8.0 ),
          child: Text(headerText!,style: headerStyle,),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
          height: 45.0,
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(charLength)
            ],
            maxLines: maxLine,
            controller: controller,
            focusNode: focusNode,
            keyboardType: inputType,
            textInputAction: inputAction,
            onChanged: onChange,
            onSubmitted: onSubmit,
            obscureText: obscureText,
            decoration: InputDecoration(

              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              hintText: hintText,

              labelText: labelText!.isEmpty?hintText:labelText,
    //            labelStyle: TextStyle(
    //              color: focusNode!.hasFocus ? Colors.blue : Colors.red,
    // ),
              prefixIcon: prefixIcon == null
                  ? null
                  : IconButton(onPressed: prefixOnTap, icon: Icon(prefixIcon)),
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(onPressed: suffixOnTap, icon: Icon(suffixIcon,color: lightBlackColor,)),
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
        )
      ],
    );
  }
}


