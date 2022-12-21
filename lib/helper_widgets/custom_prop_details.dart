
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/text_styles.dart';
import '../utils/Functions.dart';
import '../utils/handlers.dart';
import '../utils/launchers.dart';
import 'custom_icon_button.dart';

class CustomPropertyDetailsWidget extends StatefulWidget {
final Widget imagesListBuild;

  final String category;
  final String purpose;
  final double amount;
  final int propId;
  final String detailsAddress;
  final int noOfBath;
  final int noOfBeds;
  final String landArea;
  final String unit;
  final String content;
  final String phoneNo;

  CustomPropertyDetailsWidget({  required this.imagesListBuild,required this.category, required this.purpose, required this.amount, required this.propId, required this.detailsAddress, required this.noOfBath, required this.noOfBeds, required this.landArea, required this.unit, required this.content, required this.phoneNo });


  @override
  State<CustomPropertyDetailsWidget> createState() => _CustomPropertyDetailsWidgetState();
}

class _CustomPropertyDetailsWidgetState extends State<CustomPropertyDetailsWidget> {
  bool showAllText = false;

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
                    child: widget.imagesListBuild
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
                      Text(widget.category+ " for " +"${widget.purpose}",
                          style: propertyNameStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.amount}",
                              style: priceStyle),
                          Spacer(),
                          InkWell(
                              onTap: () async{
                                isFavourite =! isFavourite;
                                String userId=await getUserId();
                                setState((){});
                                isFavourite?addFavouritePropHandler(
                                    context: context,
                                    typeId:widget.propId,
                                    userId:"$userId"
                                ):delFavPropHandler(
                                    userId: "$userId",
                                    context: context,
                                    propId:widget.propId
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
                            "${widget.detailsAddress}",
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
                                  "${widget.noOfBath}",
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
                                  "${"${widget.noOfBeds}"}",
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
                                    "${widget.landArea} " +
                                        " ${widget.unit}",
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
                            text: widget.content!.substring(
                                0,
                                showAllText == true
                                    ? null
                                    : (widget.content!.length / 4)
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

                  makePhoneCall('${widget.phoneNo}');
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
                    '${widget.phoneNo}'
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


