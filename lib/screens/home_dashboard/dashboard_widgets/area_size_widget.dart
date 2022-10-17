

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/models/area_size_model.dart';
import 'package:fincabay_application/models/property_type_model.dart';
import 'package:flutter/material.dart';

import '../../../configs/text_styles.dart';

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
class PropertyTypeWidget extends StatelessWidget {
  PropertyTypeModel type;
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
class LocationWidget1 extends StatelessWidget {
  final String locationName;
  LocationWidget1({required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5.0,horizontal: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width/4.0,
      height: MediaQuery.of(context).size.height/11.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: black26,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(locationName,style: labelStyle2,),
    );
  }
}