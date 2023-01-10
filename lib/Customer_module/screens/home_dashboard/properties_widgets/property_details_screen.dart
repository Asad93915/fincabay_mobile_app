import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/utils/launchers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../configs/api_configs.dart';
import '../../../../helper_widgets/custom_icon_button.dart';
import '../../../../helper_widgets/custom_prop_details.dart';
import '../../../../utils/Functions.dart';
import '../../../../utils/handlers.dart';
import '../../../models/get_favourite_property_model.dart';
import '../../../models/get_user_properties_model.dart';
import '../../../models/prop_list_model.dart';
import '../../../models/property_search_model.dart';


class UserPropertiesDetailsScreen extends StatefulWidget {
  UserProperties prop;

  UserPropertiesDetailsScreen({required this.prop});

  @override
  State<UserPropertiesDetailsScreen> createState() => _UserPropertiesDetailsScreenState();
}

class _UserPropertiesDetailsScreenState extends State<UserPropertiesDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomPropertyDetailsWidget(
      imagesListBuild: ListView.builder(
          itemCount: widget.prop.propertyImages!.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext, index) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                  "http://173.208.142.67:5955/fincabayapi/${widget.prop.propertyImages![index].imageURL}",
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.cover
                ),
                Positioned(

                  child: Container(

                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child:
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bgColor,
                        size: 20.0,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                    ),
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/12 ,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  top: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 6.0),
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_rounded,
                            color: whiteColor,
                            size: 20.0,
                          ),
                          Text(
                            "${index + 1}" +
                                "/" +
                                widget
                                    .prop.propertyImages!.length
                                    .toString(),
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
              ],
            );
          }),
      category: widget.prop.category??"",
      purpose: widget.prop.purpose??"",
      amount: widget.prop.amount??0.0,
      detailsAddress: widget.prop.detailAddress??"",
      noOfBath: widget.prop.noOfBaths??0,
      noOfBeds: widget.prop.noOfBeds??0,
      landArea: widget.prop.landArea!,
      unit: widget.prop.unit??"null",
      content: widget.prop.content??"",
      propId: widget.prop.id??0,
      phoneNo: widget.prop.userMobile??"03000",

    );
  }
}




class FavouritePropertiesDetailsScreen extends StatefulWidget {
    FavouriteProperty prop;
   FavouritePropertiesDetailsScreen({required this.prop});

  @override
  State<FavouritePropertiesDetailsScreen> createState() => _FavouritePropertiesDetailsScreenState();
}

class _FavouritePropertiesDetailsScreenState extends State<FavouritePropertiesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPropertyDetailsWidget(
      imagesListBuild: ListView.builder(
          itemCount: widget.prop.propertyImages!.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext, index) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                  "http://173.208.142.67:5955/fincabayapi/${widget.prop.propertyImages![index].imageURL}",
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.cover,
                ),
                Positioned(

                  child: Container(

                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child:
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bgColor,
                        size: 20.0,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                    ),
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/12 ,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  top: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 6.0),
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_rounded,
                            color: whiteColor,
                            size: 20.0,
                          ),
                          Text(
                            "${index + 1}" +
                                "/" +
                                widget
                                    .prop.propertyImages!.length
                                    .toString(),
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
              ],
            );
          }),
      category: widget.prop.category??"",
      purpose: widget.prop.purpose??"",
      amount: widget.prop.amount??0.0,
      detailsAddress: widget.prop.detailAddress??"",
      noOfBath: widget.prop.noOfBaths??0,
      noOfBeds: widget.prop.noOfBeds??0,
      landArea: widget.prop.landArea!,
      unit: widget.prop.unit??"null",
      content: widget.prop.content??"",
      propId: widget.prop.id??0,
      phoneNo: widget.prop.userMobile??"03000",

    );
  }
}


class PropertySearchDetailsScreen extends StatefulWidget {
  PropertySearch prop;
  PropertySearchDetailsScreen({required this.prop});

  @override
  State<PropertySearchDetailsScreen> createState() => _PropertySearchDetailsScreenState();
}

class _PropertySearchDetailsScreenState extends State<PropertySearchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPropertyDetailsWidget(
      imagesListBuild: ListView.builder(
          itemCount: widget.prop.propertyImages!.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext, index) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                  "http://173.208.142.67:5955/fincabayapi/${widget.prop.propertyImages![index].imageURL}",
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.cover,
                ),
                Positioned(

                  child: Container(

                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child:
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bgColor,
                        size: 20.0,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                    ),
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/12 ,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  top: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 6.0),
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_rounded,
                            color: whiteColor,
                            size: 20.0,
                          ),
                          Text(
                            "${index + 1}" +
                                "/" +
                                widget
                                    .prop.propertyImages!.length
                                    .toString(),
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
              ],
            );
          }),
      category: widget.prop.category??"",
      purpose: widget.prop.purpose??"",
      amount: widget.prop.amount??0.0,
      detailsAddress: widget.prop.detailAddress??"",
      noOfBath: widget.prop.noOfBaths??0,
      noOfBeds: widget.prop.noOfBeds??0,
      landArea: widget.prop.landArea!,
      unit: widget.prop.unit??"null",
      content: widget.prop.content??"",
      propId: widget.prop.id??0,
      phoneNo: widget.prop.userMobile??"03000",

    );
  }
}

class PropListDetailsScreen extends StatefulWidget {
  PropertyList prop;
  PropListDetailsScreen({required this.prop});

  @override
  State<PropListDetailsScreen> createState() => _PropListDetailsScreenState();
}

class _PropListDetailsScreenState extends State<PropListDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPropertyDetailsWidget(
      imagesListBuild: ListView.builder(
          itemCount: widget.prop.propertyImages!.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext, index) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                  "http://173.208.142.67:5955/fincabayapi/${widget.prop.propertyImages![index].imageURL}",
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.cover,
                ),
                Positioned(

                  child: Container(

                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child:
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bgColor,
                        size: 20.0,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                    ),
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/12 ,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  top: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 6.0),
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_rounded,
                            color: whiteColor,
                            size: 20.0,
                          ),
                          Text(
                            "${index + 1}" +
                                "/" +
                                widget
                                    .prop.propertyImages!.length
                                    .toString(),
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
              ],
            );
          }),
      category: widget.prop.category??"",
      purpose: widget.prop.purpose??"",
      amount: widget.prop.amount??0.0,
      detailsAddress: widget.prop.detailAddress??"",
      noOfBath: widget.prop.noOfBaths??0,
      noOfBeds: widget.prop.noOfBeds??0,
      landArea: widget.prop.landArea!,
      unit: widget.prop.unit??"null",
      content: widget.prop.content??"",
      propId: widget.prop.id??0,
      phoneNo: widget.prop.userMobile??"03000",

    );
  }
}

