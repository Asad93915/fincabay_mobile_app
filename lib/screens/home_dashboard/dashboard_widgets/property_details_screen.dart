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

  PropertyDetailsScreen(
      {this.imageUrl = '', this.sellingAsset = '', this.price = ''});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  bool showAllText = false;
  String descriptionText="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
          actions: [Icon(Icons.share)],
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
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
                        Icon(
                          CupertinoIcons.heart,
                          color: pkrColor,
                        ),
                        Icon(
                          Icons.share,
                          color: pkrColor,
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
                        Icon(
                          Icons.location_on,
                          color: bgColor,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Bahria Town, Lahore",
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
                              Icon(
                                Icons.bathtub,
                                color: bgColor,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "4",
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
                              Icon(
                                Icons.bed,
                                color: bgColor,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "4",
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
                              Icon(
                                Icons.filter_center_focus_outlined,
                                color: bgColor,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "5 Marla",
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
              Card(

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 12.0),
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
                           onTap: (){
                             showAllText =!showAllText;
                             setState((){});
                           },
                           child: Icon(showAllText==true?Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined)),

                     ],
                   ),

                    RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                      text: "${descriptionText.substring(0,showAllText?null:(descriptionText.length/5).toInt())}",style: forgotStyle,
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

                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        border: Border.all(color: black26,width: 1.5)
      ),
      height: kToolbarHeight*1.2,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            icon: Icons.phone,
            width: MediaQuery.of(context).size.width/3,
            text: "Call",
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            onTap: (){},
            horizontalMargin: 10.0,
          ),
          Container(
            height: kToolbarHeight*0.6,
            width: 1.5,
            color: black26,
          ),
          CustomIconButton(
            icon: Icons.phone,
            width: MediaQuery.of(context).size.width/3,
            text: "Message",
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            onTap: (){},
            horizontalMargin: 10.0,
          ),
        ],
      ),
    ),
    );
  }
}
