

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/models/get_all_area_unit_model.dart';
import 'package:fincabay_application/models/property_type_model.dart';
import 'package:flutter/material.dart';

import '../../../configs/text_styles.dart';

class AreaSizeWidget extends StatelessWidget {
  AreaUnit areaUnitModel;
  final Function()?onTap;
   AreaSizeWidget({required this.areaUnitModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 5.0),
        padding: EdgeInsets.symmetric(vertical: 6.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width/4.0,
        height: MediaQuery.of(context).size.height/11.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(areaUnitModel.name!,style: labelStyle2,),

            // Text(areaType,style: TextStyle(color: lightBlackColor,fontSize: 14.0,height: 1.6),)
          ],
        ),
      ),
    );
  }
}
class PropertyTypeWidget extends StatelessWidget {
  PropertyType type;
  PropertyTypeWidget({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 5.0),
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
      child: Text(type.type!,style: labelStyle2,),
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