import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/Agents_module/services/agent_properties_service.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/dialogs/show_will_pop_dialog.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/colors.dart';
import '../../configs/text_styles.dart';
import '../../customer_module/screens/home_dashboard/dashboard_widgets/property_details_screen.dart';
import '../../helper_widgets/custom_button.dart';
import '../../helper_widgets/house_details.dart';
import '../models/agent_properties_model.dart';
import 'agents_drawer_screen.dart';

class ManageAgentPropertiesScreen extends StatefulWidget {
  @override
  State<ManageAgentPropertiesScreen> createState() =>
      _ManageAgentPropertiesScreenState();
}

class _ManageAgentPropertiesScreenState
    extends State<ManageAgentPropertiesScreen> {
  _getAgentProperties() async {
    CustomLoader.showLoader(context: context);
    await ManageAgentPropertiesService().getAgentProp(
        context: context,
        agentEmail: Provider.of<UserDataProvider>(context, listen: false)
            .user!
            .email!);
    CustomLoader.hideLoader(context);
  }

  List<AgentProperties> data = [];
  List<AgentProperties> rentList = [];
  List<AgentProperties> saleList = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAgentProperties();
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String imageUrl = "assets/images/property_image.jpg";

    return WillPopScope(
      onWillPop: () async{
        return await showWillPopDialog(context);
      },
      child: Scaffold(
        endDrawer: AgentsDrawer(
          isSelected: true,
        ),
        drawer: AgentsDrawer(),
        backgroundColor: barColor,
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          ),
          actions: [
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                      setState(() {});
                    },
                    icon: Icon(Icons.sort)))
          ],
          title: Text(
            "Manage Properties",
            style: barStyle,
          ),
          backgroundColor: bgColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Consumer<AgentPropertiesProvider>(
                builder: (context, prop, _) {
                  prop.getProperties!.forEach((element) {
                    if (element.purpose == 'Sale') {
                      saleList.add(element);
                    } else {
                      rentList.add(element);
                    }
                  });
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("For Sale",style: logoStyle,),
                      Container(

                        margin: EdgeInsets.only(top: 8.0),
                        height: MediaQuery.of(context).size.height/4.0,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: prop.getProperties!.length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (BuildContext, index) {
                              return InkWell(
                                onTap: () async {
                                  Future.delayed(Duration(microseconds: 1), () {
                                    Center(
                                        child: CircularProgressIndicator(
                                            color: bgColor));
                                    NavigationServices.goNextAndKeepHistory(
                                        context: context,
                                        widget: PropertyDetailsScreen(
                                          imageUrl: imageUrl,
                                          sellingAsset:
                                              "${saleList[index].propertyType}",
                                          noOfBeds: saleList[index].noOfBeds!,
                                          noOfBaths: saleList[index].noOfBaths!,
                                          description:
                                              saleList[index].description!,
                                          unit: saleList[index].unit!,
                                          landArea: saleList[index].landArea!,
                                          address: saleList[index].detailAddress!,
                                          price:
                                              saleList[index].amount.toString(),
                                        ));
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: 'propertyUrl',
                                          child: Image.asset(
                                            "$imageUrl",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4.5,
                                            width: 125.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0, top: 8.0,),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Expire After ${prop.getProperties![index].expireAfter}"),
                                              Text(
                                                "PKR ${prop.getProperties![index].amount}",
                                                style: pkrStyle,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.78,
                                                child: Text(
                                                  prop.getProperties![index]
                                                      .detailAddress!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: addressStyle,
                                                ),
                                              ),
                                              Text(
                                                "${prop.getProperties![index].propertyType}" +
                                                    " For " +
                                                    "${prop.getProperties![index].purpose}",
                                                style: houseStyle,
                                              ),
                                              SizedBox(
                                                height: 1.0,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    HouseDetails(
                                                      icon: Icons.bed_outlined,
                                                      title:
                                                          "${prop.getProperties![index].noOfBeds}",
                                                    ),
                                                    HouseDetails(
                                                      icon:
                                                          Icons.bathtub_outlined,
                                                      title:
                                                          "${prop.getProperties![index].noOfBaths}",
                                                    ),
                                                    HouseDetails(
                                                      icon: Icons.house,
                                                      title:
                                                          "${prop.getProperties![index].landArea}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.7,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomButton(
                                                      verticalMargin: 5.0,
                                                      height: 30.0,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5.8,
                                                      bgColor: whiteColor,
                                                      borderColor: bgColor,
                                                      text: "SMS",
                                                      textColor: bgColor,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.w600,
                                                      onTap: () {},
                                                    ),
                                                    SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    Container(
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                                vertical: 5.0),
                                                        height: 30.0,
                                                        child:
                                                            ElevatedButton.icon(
                                                                style: ElevatedButton.styleFrom(
                                                                    primary:
                                                                        bgColor,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0))),
                                                                onPressed: () {},
                                                                icon: Icon(
                                                                    Icons.call),
                                                                label: Text(
                                                                  "Call",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.0),
                                                                ))),
                                                    SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                          color: bgColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0),
                                                      child: Icon(
                                                        Icons.whatsapp,
                                                        color: whiteColor,
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              );
                            }),
                      ),

                      Text("For Rent",style: logoStyle,),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        height: MediaQuery.of(context).size.height/4.0,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: rentList.length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (BuildContext, index) {
                              return InkWell(
                                onTap: () async {
                                  Future.delayed(Duration(microseconds: 1), () {
                                    Center(
                                        child: CircularProgressIndicator(
                                            color: bgColor));
                                    NavigationServices.goNextAndKeepHistory(
                                        context: context,
                                        widget: PropertyDetailsScreen(
                                          imageUrl: imageUrl,
                                          sellingAsset:
                                              "${rentList[index].propertyType}",
                                          noOfBeds: rentList[index].noOfBeds!,
                                          noOfBaths: rentList[index].noOfBaths!,
                                          description: rentList[index].description!,
                                          unit: rentList[index].unit!,
                                          landArea: rentList[index].landArea!,
                                          address: rentList[index].detailAddress!,
                                          price: rentList[index].amount
                                              .toString(),
                                        ));
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: 'propertyUrl',
                                          child: Image.asset(
                                            "$imageUrl",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4.5,
                                            width: 125.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0,),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Expire After ${rentList[index].expireAfter}"),
                                              Text(
                                                "PKR ${rentList[index].amount}",
                                                style: pkrStyle,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.78,
                                                child: Text(
                                                  rentList[index].detailAddress!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: addressStyle,
                                                ),
                                              ),
                                              Text(
                                                "${rentList[index].propertyType}" +
                                                    " For " +
                                                    "${rentList[index].purpose}",
                                                style: houseStyle,
                                              ),
                                              SizedBox(
                                                height: 1.0,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    HouseDetails(
                                                      icon: Icons.bed_outlined,
                                                      title:
                                                          "${rentList[index].noOfBeds}",
                                                    ),
                                                    HouseDetails(
                                                      icon:
                                                          Icons.bathtub_outlined,
                                                      title:
                                                          "${rentList[index].noOfBaths}",
                                                    ),
                                                    HouseDetails(
                                                      icon: Icons.house,
                                                      title:
                                                          "${rentList[index].landArea}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.7,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomButton(
                                                      verticalMargin: 5.0,
                                                      height: 30.0,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5.8,
                                                      bgColor: whiteColor,
                                                      borderColor: bgColor,
                                                      text: "SMS",
                                                      textColor: bgColor,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.w600,
                                                      onTap: () {},
                                                    ),
                                                    SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.0),
                                                        height: 30.0,
                                                        child:
                                                            ElevatedButton.icon(
                                                                style: ElevatedButton.styleFrom(
                                                                    primary:
                                                                        bgColor,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0))),
                                                                onPressed: () {},
                                                                icon: Icon(
                                                                    Icons.call),
                                                                label: Text(
                                                                  "Call",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.0),
                                                                ))),
                                                    SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                          color: bgColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),
                                                      margin:
                                                          EdgeInsets.only(top: 5.0),
                                                      child: Icon(
                                                        Icons.whatsapp,
                                                        color: whiteColor,
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
