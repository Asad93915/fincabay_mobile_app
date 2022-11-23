import 'dart:convert';

import 'package:fincabay_application/Agents_module/screens/staff/agency_staff_screen.dart';
import 'package:fincabay_application/Agents_module/screens/agents_add_property_screen.dart';
import 'package:fincabay_application/Agents_module/screens/update_agent_profile_screen.dart';
import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/auth/screens/login_screen.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/drawer_item_card.dart';
import 'package:fincabay_application/utils/Functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/text_styles.dart';
import '../../helper_widgets/manage_prop_drawer_widget.dart';
import '../../utils/local_storage_services.dart';
import '../../utils/variable_storage.dart';
import 'agents_home_screen.dart';
import 'get_agent_properties_screen.dart';

class AgentsDrawer extends StatefulWidget {
 final bool isSelected;
  const AgentsDrawer({Key? key, this.isSelected=false}) : super(key: key);

  @override
  State<AgentsDrawer> createState() => _AgentsDrawerState();
}

class _AgentsDrawerState extends State<AgentsDrawer> {

  UserModel user=UserModel();

  int? selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    initMethod();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {

 return  widget.isSelected==false?
 Container(
      padding: EdgeInsets.only(top: 30.0,left: 12.0),
      color: barColor,
      width: MediaQuery.of(context).size.width/1.4,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/fincabay_logo.jpg",height: 50.0,),
              Text("Fincabay.com",style: logoStyle,)
              // Text("${user.name}",style: logoStyle,)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Text(user.userName??"",style: nameStyle),
                ),

              IconButton(onPressed: (){

                print("User Id ${user.id}");
              }, icon: Icon(Icons.arrow_forward_outlined,color: bgColor,)),
            ],
          ),
          Divider(
            thickness: 1.2,
          ),
          DrawerItemCard(
            icon: Icons.home,
            selctedColor:selectedIndex==0?true:false ,
            title: "Home",
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: AgentHomeScreen());
              selectedIndex=0;
              setState((){});
            },
          ),
          DrawerItemCard(
            icon: Icons.add,
            selctedColor:selectedIndex==1?true:false ,
            title: "Add Property",
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: AgentsAddPropertyScreen());
              selectedIndex=1;
              setState((){});
            },
          ),
          DrawerItemCard(
            icon: Icons.real_estate_agent,
            selctedColor:selectedIndex==2?true:false ,
            title: "Manage Property",
            onTap: (){

              NavigationServices.goNextAndKeepHistory(context: context, widget: ManageAgentPropertiesScreen(
                agentEmail: user.email??"",

              ));
              setState((){});
              selectedIndex=2;

            },
          ),
          DrawerItemCard(
            icon: Icons.person,
            selctedColor:selectedIndex==3?true:false ,
            title: "Update Profile",
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: UpdateAgentProfileScreen(
                userName:user.name! ,
                userEmail: user.email!,
                password: user.password!,
                mobileNo: user.phoneNumber!,
                agencyName: user.agencyName==null?"null":user.agencyName!,
                compFax: user.companyFax==null?"null":user.companyFax!,
                serviceDescription: user.servicesDescription==null?"null":user.servicesDescription!,
                city: user.city==null?"null":user.city!,

              ));
              selectedIndex=3;
              setState((){});
            },
          ),
          DrawerItemCard(
            icon: Icons.people_alt_rounded,
            selctedColor:selectedIndex==4?true:false ,
            title: "Agency Staff",
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: AgencyStaffScreen(
                agentEmail: user.email!,));
              selectedIndex=4;
              setState((){});
            },
          ),


          Spacer(),
          DrawerItemCard(
            icon: Icons.logout,

            title: "Logout",
            onTap: ()async{

              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();

              NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: LoginScreen());
              setState((){});
            },
          ),
        ],
      ),

    ):
 Container(
   decoration: BoxDecoration(
     color: barColor,
     borderRadius:BorderRadius.only(
         topRight: Radius.circular(8.0),
         topLeft: Radius.circular(8.0)
     ),
   ),
   alignment: Alignment.center,
   height: MediaQuery.of(context).size.height/2,
   margin: EdgeInsets.symmetric(horizontal: 10.0),

   width: MediaQuery.of(context).size.width / 1.8,

   child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Container(
         padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
         width: double.infinity,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
                 topRight: Radius.circular(8.0),
                 topLeft: Radius.circular(8.0)
             ),
             color: bgColor
         ),
         child: Text("Tools",style: TextStyle(color: whiteColor,fontSize: 16.0,fontWeight: FontWeight.w600),),
       ),
       ManagePropDrawerWidget(
         titleText: "Inventory Search",
       ),
       ManagePropDrawerWidget(
         titleText: "Post New Listing",
       ),
       ManagePropDrawerWidget(
         titleText: "Zone Detail",
       ),
       ManagePropDrawerWidget(
         titleText: "Listing Policy",
       ),
       Container(
         padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
         width: double.infinity,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
                 topRight: Radius.circular(8.0),
                 topLeft: Radius.circular(8.0)
             ),
             color: bgColor
         ),
         child: Text("Listings",style: TextStyle(color: whiteColor,fontSize: 16.0,fontWeight: FontWeight.w600),),
       ),
       ManagePropDrawerWidget(
         titleText: "Activity",
       ),
       ManagePropDrawerWidget(
         titleText: "Edited",
       ),ManagePropDrawerWidget(
         titleText: "Pending",
       ),
     ],
   ),
 );
  }

  initMethod()async{
    user=await getUser();
    setState((){});
    print("${user.email}");
  }
}
