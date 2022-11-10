import 'package:fincabay_application/Agents_module/screens/staff/agency_staff_screen.dart';
import 'package:fincabay_application/Agents_module/screens/agents_add_property_screen.dart';
import 'package:fincabay_application/Agents_module/screens/update_agent_profile_screen.dart';
import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/auth/screens/login_screen.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/drawer_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../configs/text_styles.dart';
import '../../helper_widgets/manage_prop_drawer_widget.dart';
import 'agents_home_screen.dart';
import 'get_agent_properties_screen.dart';

class AgentsDrawer extends StatefulWidget {
 final bool isSelected;
  const AgentsDrawer({Key? key, this.isSelected=false}) : super(key: key);

  @override
  State<AgentsDrawer> createState() => _AgentsDrawerState();
}

class _AgentsDrawerState extends State<AgentsDrawer> {

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    UserModel user=UserModel.fromJson(box.read('user'));
 return  widget.isSelected==false?Container(
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Expanded(
                child
                    : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Text(user.userName!,style: nameStyle),
                ),
                flex: 1,
              ),
              IconButton(onPressed: (){

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
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: ManageAgentPropertiesScreen(
                agentEmail: user.email!,
              ));
              selectedIndex=2;
              setState((){});
            },
          ),
          DrawerItemCard(
            icon: Icons.person,
            selctedColor:selectedIndex==3?true:false ,
            title: "Update Profile",
            onTap: (){
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: UpdateAgentProfileScreen(
                userName:user.name! ,
                userEmail: user.email!,
                mobileNo: user.phoneNumber!,
                agencyName: "user.agencyName",
                compFax: "user.companyFax!",
                serviceDescription: "user.servicesDescription!",
                city: user.city!,

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
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AgencyStaffScreen(
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
              Navigator.of(context);
              await box.remove('user');
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());

              setState((){});
            },
          ),
        ],
      ),

    ):Container(
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
}
