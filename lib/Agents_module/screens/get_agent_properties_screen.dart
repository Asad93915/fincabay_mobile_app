import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/Agents_module/services/agent_properties_service.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/customer_module/cusomer_drawer_screen.dart';
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
import 'agent_property_details_screen.dart';
import 'agents_drawer_screen.dart';

class ManageAgentPropertiesScreen extends StatefulWidget {
  final String agentEmail;
  final bool showDrarwer;

  ManageAgentPropertiesScreen(
      {required this.agentEmail, this.showDrarwer = true});

  @override
  State<ManageAgentPropertiesScreen> createState() =>
      _ManageAgentPropertiesScreenState();
}

class _ManageAgentPropertiesScreenState
    extends State<ManageAgentPropertiesScreen> {
  _getAgentProperties() async {
    CustomLoader.showLoader(context: context);
    await ManageAgentPropertiesService()
        .getAgentProp(context: context, agentEmail: "${widget.agentEmail}");
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

    return Scaffold(
      // endDrawer: AgentsDrawer(
      //   isSelected: true,
      // ),
      drawer: widget.showDrarwer == true ? AgentsDrawer() : CustomDrawer(),
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
                // prop.getProperties!.forEach((element) {
                //   print("purpose ${element.purpose}");
                //   if (element.purpose == 'Sell') {
                //     saleList.add(element);
                //   } else {
                //     rentList.add(element);
                //   }
                // });
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For Sale",
                      style: logoStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      height: MediaQuery.of(context).size.height / 4.0,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: prop.getProperties!.length,
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext, index) {
                            return prop.getProperties![index].purpose=="Sell"?GetAgentPropertiesWidget(
                              prop: prop.getProperties![index],
                            ):SizedBox();
                          }),
                    ),
                    Text(
                      "For Rent",
                      style: logoStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      height: MediaQuery.of(context).size.height / 4.0,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: prop.getProperties!.length,
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext, index) {
                            return prop.getProperties![index].purpose=="Rent Out"?GetAgentPropertiesWidget(
                              prop: prop.getProperties![index],
                            ):SizedBox();
                          }),
                    ),
                    Text(
                      "For Purchase",
                      style: logoStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      height: MediaQuery.of(context).size.height / 4.0,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: prop.getProperties!.length,
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext, index) {
                            return prop.getProperties![index].purpose=="Purchase"?GetAgentPropertiesWidget(
                              prop: prop.getProperties![index],
                            ):SizedBox();
                          }),
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GetAgentPropertiesWidget extends StatelessWidget {
  AgentProperties prop;

  GetAgentPropertiesWidget({required this.prop});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationServices.goNextAndKeepHistory(context: context, widget: AgentPropertyDetailsScreen(properties: prop));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              prop.propertyImages != null
                  ? Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "http://173.208.142.67:5955/fincabayapi/${prop.propertyImages![0].imageURL}",
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: 125.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 6.0),
                      width: 50.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image_rounded,color: whiteColor,size: 20.0,),
                          Text(prop.propertyImages!.length.toString(),style: TextStyle(color: whiteColor,fontSize: 14.0,fontWeight: FontWeight.w500),),
                        ],
                      )),
                ],
              )
                  : Image.asset(
                      "assets/images/property_image.jpg",
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: 125.0,
                      fit: BoxFit.fill,
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expire After ${prop.expireAfter}"),
                    Text(
                      "PKR ${prop.amount}",
                      style: pkrStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.78,
                      child: Text(
                        prop.detailAddress!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: addressStyle,
                      ),
                    ),
                    Text(
                      "${prop.category}" + " For " + "${prop.purpose}",
                      style: houseStyle,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HouseDetails(
                            icon: Icons.bed_outlined,
                            title: "${prop.noOfBeds}",
                          ),
                          HouseDetails(
                            icon: Icons.bathtub_outlined,
                            title: "${prop.noOfBaths}",
                          ),
                          HouseDetails(
                            icon: Icons.house,
                            title: "${prop.landArea}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            verticalMargin: 5.0,
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 5.8,
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
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 30.0,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: bgColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  onPressed: () {},
                                  icon: Icon(Icons.call),
                                  label: Text(
                                    "Call",
                                    style: TextStyle(fontSize: 14.0),
                                  ))),
                          SizedBox(
                            width: 3.0,
                          ),
                          Expanded(
                              child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
  }
}
