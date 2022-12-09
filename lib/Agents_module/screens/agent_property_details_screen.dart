
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/text_styles.dart';
import '../../helper_widgets/custom_icon_button.dart';
import '../../helper_widgets/custom_prop_details_widget.dart';
import '../../utils/Functions.dart';
import '../../utils/handlers.dart';
import '../models/agent_properties_model.dart';

class AgentPropertyDetailsScreen extends StatefulWidget {
  AgentProperties properties;

  AgentPropertyDetailsScreen({required this.properties});

  @override
  State<AgentPropertyDetailsScreen> createState() => _PropertyDetailsScreen1State();
}

class _PropertyDetailsScreen1State extends State<AgentPropertyDetailsScreen> {
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
                          CustomPropDetailsWidget(
                            imageUrl: "assets/icons/bath_icon.png",
                            title:"${widget.properties.noOfBaths}" ,
                          ),
                          CustomPropDetailsWidget(
                            imageUrl: "assets/icons/bed_icon.png",
                            title:"${widget.properties.noOfBeds}" ,
                          ),
                          CustomPropDetailsWidget(
                            imageUrl: "assets/icons/marla_icon.png",
                            title:"${widget.properties.landArea} " +
                                " ${widget.properties.unit}" ,
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
