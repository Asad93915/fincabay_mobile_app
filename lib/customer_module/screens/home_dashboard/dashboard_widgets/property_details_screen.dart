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
import '../../../../utils/Functions.dart';
import '../../../../utils/handlers.dart';
import '../../../models/get_favourite_property_model.dart';
import '../../../models/get_user_properties_model.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String sellingAsset;
  final String price;
  final String address;
  final int noOfBeds;
  final int noOfBaths;
  final String landArea;
  final String unit;
  final String description;
  final int itemCount;
  final String mobileNo;
  PropertyDetailsScreen(
      {this.imageUrl = '',
      this.sellingAsset = '',
      this.price = '',
      required this.address,
      required this.noOfBeds,
      required this.noOfBaths,
      required this.landArea,
      required this.unit,
      required this.description,
      this.itemCount = 0, required this.mobileNo});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  bool showAllText = false;
  String descriptionText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: whiteColor,
            // leading: IconButton(
            //   onPressed: () {
            //     // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen());
            //   },
            //   icon: Icon(
            //     Icons.arrow_back_ios_new,
            //     color: blackColor,
            //   ),
            // ),
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.7,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              child: FlexibleSpaceBar(
                  // background: Hero(
                  //   tag: "propertyUrl",
                  background:
                  Image.asset(widget.imageUrl,fit: BoxFit.fill,),
                  ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.sellingAsset, style: propertyNameStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.price, style: priceStyle),
                          Spacer(),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/icons/favourite_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/icons/share_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/location_icon.png",
                            height: 20.0,
                            width: 20.0,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            widget.address,
                            style: locationStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bath_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  widget.noOfBaths.toString(),
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bed_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${widget.noOfBeds}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/marla_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${widget.landArea} " + " ${widget.unit}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: priceStyle,
                          ),
                          InkWell(
                              onTap: () {
                                showAllText = !showAllText;
                                setState(() {});
                              },
                              child: Icon(showAllText == true
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined)),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                                "${widget.description.substring(0, showAllText == true ? null : (widget.description.length / 4).toInt())}",
                            style: forgotStyle,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showAllText = !showAllText;
                                    setState(() {});
                                  },
                                text: showAllText == true ? " Less" : " More",
                                style: lessStyle,
                              )
                            ])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: black26, width: 1.5)),
        height: kToolbarHeight * 1.2,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomIconButton(
                icon: Icons.phone,
                width: MediaQuery.of(context).size.width / 3,
                text: "Call",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {
                  makePhoneCall(
                    '${widget.mobileNo}'
                  );
                },
                horizontalMargin: 10.0,
              ),
            ),
            Container(
              height: kToolbarHeight * 0.6,
              width: 1.5,
              color: black26,
            ),
            Expanded(
              child: CustomIconButton(
                icon: Icons.message,
                width: MediaQuery.of(context).size.width / 3,
                text: "Message",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {
                  sendMessage(message, [
                    '${widget.mobileNo}'
                  ]);
                },
                horizontalMargin: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPropertiesDetailsScreen extends StatefulWidget {
  UserProperties properties;

  UserPropertiesDetailsScreen({required this.properties});

  @override
  State<UserPropertiesDetailsScreen> createState() => _UserPropertiesDetailsScreenState();
}

class _UserPropertiesDetailsScreenState extends State<UserPropertiesDetailsScreen> {
  bool showAllText = false;
  String descriptionText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: whiteColor,
            iconTheme: IconThemeData(color: Colors.transparent),
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.7,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              child: FlexibleSpaceBar(
                  // background: Hero(
                  //   tag: "propertyUrl",

                  background: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                    itemCount: widget.properties.propertyImages!.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext, index) {
                      return Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image.network(
                            "http://173.208.142.67:5955/fincabayapi/${widget.properties.propertyImages![index].imageURL}",
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
                                              .properties.propertyImages!.length
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
              )
                  // )
                  ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.properties.category!+ " for " +"${widget.properties.purpose}",
                          style: propertyNameStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.properties.amount}",
                              style: priceStyle),
                          Spacer(),
                          InkWell(
                              onTap: () async{
                               isFavourite =! isFavourite;
                               String userId=await getUserId();
                               setState((){});
                               isFavourite?addFavouritePropHandler(
                                   context: context,
                                   typeId:widget.properties.id!,
                                   userId:"$userId"
                               ):delFavPropHandler(
                                 userId: "$userId",
                                 context: context,
                                 propId: widget.properties.id!
                               );
                              },
                              child:isFavourite==false?Image.asset(
                                "assets/icons/favourite_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              ):Icon(CupertinoIcons.heart_fill,color: redColor,size: 25.0,)
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/icons/share_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/location_icon.png",
                            height: 20.0,
                            width: 20.0,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "${widget.properties.detailAddress}",
                            style: locationStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bath_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${widget.properties.noOfBaths}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bed_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${"${widget.properties.noOfBeds}"}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/marla_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.properties.landArea} " +
                                        " ${widget.properties.unit}",
                                    style: iconStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: priceStyle,
                          ),
                          InkWell(
                              onTap: () {
                                showAllText = !showAllText;
                                setState(() {});
                              },
                              child: Icon(showAllText == true
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined)),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            // widget.description.substring(0,showAllText==true?null:(widget.description.length/4).toInt())
                            text: widget.properties.content!.substring(
                                0,
                                showAllText == true
                                    ? null
                                    : (widget.properties.content!.length / 4)
                                        .toInt()),
                            style: forgotStyle,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showAllText = !showAllText;
                                    setState(() {});
                                  },
                                text: showAllText == true ? " Less" : " More",
                                style: lessStyle,
                              )
                            ])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: black26, width: 1.5)),
        height: kToolbarHeight * 1.2,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomIconButton(
                icon: Icons.phone,
                width: MediaQuery.of(context).size.width / 3,
                text: "Call",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {
                  makePhoneCall(widget.properties.userMobile??"12345");
                },
                horizontalMargin: 10.0,
              ),
            ),
            Container(
              height: kToolbarHeight * 0.6,
              width: 1.5,
              color: black26,
            ),
            Expanded(
              child: CustomIconButton(
                icon: Icons.message,
                width: MediaQuery.of(context).size.width / 3,
                text: "Message",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {
                  sendMessage(message, [
                    widget.properties.userMobile??"12345"
                  ]);
                },
                horizontalMargin: 10.0,
              ),
            ),
          ],
        ),
      ),
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
  bool showAllText = false;
  String descriptionText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: whiteColor,
            iconTheme: IconThemeData(color: Colors.transparent),
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.7,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              child: FlexibleSpaceBar(
                // background: Hero(
                //   tag: "propertyUrl",

                  background: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: widget.prop.propertyImages!.isNotEmpty?ListView.builder(
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
                        }):Image.asset(
                      "$imageUrl",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.5,
                      fit: BoxFit.fill,

                    ),
                  )
                // )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.prop.category!+ " for " +"${widget.prop.purpose}",
                          style: propertyNameStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.prop.amount}",
                              style: priceStyle),
                          Spacer(),
                          InkWell(
                              onTap: () async{
                                isFavourite =! isFavourite;
                                String userId=await getUserId();
                                setState((){});
                                isFavourite?addFavouritePropHandler(
                                    context: context,
                                    typeId:widget.prop.id!,
                                    userId:"$userId"
                                ):delFavPropHandler(
                                    userId: "$userId",
                                    context: context,
                                    propId: widget.prop.id!
                                );
                              },
                              child:isFavourite==false?Image.asset(
                                "assets/icons/favourite_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              ):Icon(CupertinoIcons.heart_fill,color: redColor,size: 25.0,)
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/icons/share_icon.png",
                                height: 20.0,
                                width: 20.0,
                                fit: BoxFit.fill,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/location_icon.png",
                            height: 20.0,
                            width: 20.0,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "${widget.prop.detailAddress}",
                            style: locationStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bath_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${widget.prop.noOfBaths}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/bed_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${"${widget.prop.noOfBeds}"}",
                                  style: iconStyle,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/marla_icon.png",
                                  height: 25.0,
                                  width: 25.0,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.prop.landArea} " +
                                        " ${widget.prop.unit}",
                                    style: iconStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: priceStyle,
                          ),
                          InkWell(
                              onTap: () {
                                showAllText = !showAllText;
                                setState(() {});
                              },
                              child: Icon(showAllText == true
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined)),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          // widget.description.substring(0,showAllText==true?null:(widget.description.length/4).toInt())
                            text: widget.prop.content!.substring(
                                0,
                                showAllText == true
                                    ? null
                                    : (widget.prop.content!.length / 4)
                                    .toInt()),
                            style: forgotStyle,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showAllText = !showAllText;
                                    setState(() {});
                                  },
                                text: showAllText == true ? " Less" : " More",
                                style: lessStyle,
                              )
                            ])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration:
        BoxDecoration(border: Border.all(color: black26, width: 1.5)),
        height: kToolbarHeight * 1.2,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomIconButton(
                icon: Icons.phone,
                width: MediaQuery.of(context).size.width / 3,
                text: "Call",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {

                  makePhoneCall('${widget.prop.userMobile}');
                },
                horizontalMargin: 10.0,
              ),
            ),
            Container(
              height: kToolbarHeight * 0.6,
              width: 1.5,
              color: black26,
            ),
            Expanded(
              child: CustomIconButton(
                icon: Icons.message,
                width: MediaQuery.of(context).size.width / 3,
                text: "Message",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                onTap: () {
                  sendMessage(message, [
                    '${widget.prop.userMobile}'
                  ]);
                },
                horizontalMargin: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

