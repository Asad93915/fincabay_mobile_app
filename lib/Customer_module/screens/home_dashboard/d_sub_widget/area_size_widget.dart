

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/Customer_module/models/area_size_model.dart';

import 'package:flutter/material.dart';

import '../../../../configs/text_styles.dart';
import '../../../models/property_type_model.dart';



class AreaUnitWidget extends StatelessWidget {
  AreaSize areaUnitModel;
  final Function()?onTap;
   AreaUnitWidget({required this.areaUnitModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(


        margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 5.0),
        padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 1.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width/4.0,
        height: MediaQuery.of(context).size.height/11.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(areaUnitModel.name!,style: labelStyle2,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
      ),
    );
  }
}

