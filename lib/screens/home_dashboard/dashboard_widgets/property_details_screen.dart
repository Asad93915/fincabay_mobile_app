import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../helper_widgets/custom_icon_button.dart';

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

  PropertyDetailsScreen(
      {this.imageUrl = '', this.sellingAsset = '', this.price = '', required this.address, required this.noOfBeds, required this.noOfBaths, required this.landArea, required this.unit, required this.description});

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
                background: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
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
                            onTap: (){},
                            child: Image.asset("assets/icons/favourite_icon.png",height: 20.0,width: 20.0,fit: BoxFit.fill,)
                          ),
                          SizedBox(width: 10.0,),
                          InkWell(
                            onTap: (){},
                            child:Image.asset("assets/icons/share_icon.png",height: 20.0,width: 20.0,fit: BoxFit.fill,)
                          )
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
                            width: 20.0,fit: BoxFit.fill,),
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
                                  width: 25.0,fit: BoxFit.fill,),
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
                                  width: 25.0,fit: BoxFit.fill,),
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
                                  width: 25.0,fit: BoxFit.fill,),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${widget.landArea} "+" ${widget.unit}",
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0,),
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
                    padding:  EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: "${widget.description.substring(0,showAllText==true?null:(widget.description.length/4).toInt())}",style: forgotStyle,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  showAllText = !showAllText;
                                  setState((){});
                                },
                                text: showAllText==true?" Less":" More",
                                style: lessStyle,
                              )
                            ]
                        )),
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
                onTap: () {},
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
                onTap: () {},
                horizontalMargin: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
