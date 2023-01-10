import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/text_styles.dart';
import '../../../models/property_type_model.dart';

class PropertyTypeWidget extends StatelessWidget {
  PropertyTypeList type;
  final bool selectedColor;
  final Function()?onTap;
  PropertyTypeWidget({required this.type, this.selectedColor=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 5.0),
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width/4.0,
        height: MediaQuery.of(context).size.height/11.0,
        decoration: BoxDecoration(
          color: selectedColor==true?black12:Colors.transparent,
          border: Border.all(
            color: black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(type.type!,style: labelStyle2,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
      ),
    );
  }
}