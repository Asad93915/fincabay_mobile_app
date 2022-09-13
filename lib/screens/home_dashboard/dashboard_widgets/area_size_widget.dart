

import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/material.dart';

import '../../../configs/text_styles.dart';
import '../../../models/area_type_model.dart';

class AreaSizeWidget extends StatelessWidget {
  final String area;
  final String areaType;
  final Function()?onTap;
   AreaSizeWidget({required this.area, required this.areaType, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(area,style: labelStyle2,),
            Text(areaType,style: TextStyle(color: lightBlackColor,fontSize: 14.0,height: 1.6),)
          ],
        ),
      ),
    );
  }
}
class AreaTypeWidget extends StatelessWidget {
  AreaType areaType;
  AreaTypeWidget({required this.areaType});

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
      child: Text(areaType.areaType!,style: labelStyle2,),
    );
  }
}
class LocationWidget extends StatelessWidget {
  final String locationName;
  LocationWidget({required this.locationName});

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