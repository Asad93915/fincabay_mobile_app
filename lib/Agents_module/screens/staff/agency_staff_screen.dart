import 'package:fincabay_application/Agents_module/providers/staff_member_provider.dart';
import 'package:fincabay_application/Agents_module/screens/staff/add_agency_staff_screen.dart';
import 'package:fincabay_application/Agents_module/screens/agents_drawer_screen.dart';
import 'package:fincabay_application/Agents_module/screens/staff/get_agency_staff_widget.dart';
import 'package:fincabay_application/Agents_module/services/staff_member_service.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/dialogs/show_will_pop_dialog.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/utils/handlers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper_widgets/custom_button.dart';
class AgencyStaffScreen extends StatefulWidget {
  const AgencyStaffScreen({Key? key}) : super(key: key);

  @override
  State<AgencyStaffScreen> createState() => _AgencyStaffScreenState();
}

class _AgencyStaffScreenState extends State<AgencyStaffScreen> {


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStaffMemberHandler(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return await showWillPopDialog(context);
      },
      child: Scaffold(
        drawer: AgentsDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
      }, icon: Icon(Icons.menu),)),
          centerTitle: true,
          backgroundColor: bgColor,
          title: Text("Agency Staff",style: barStyle,),
        ),
        body: RefreshIndicator(

          onRefresh: (){
          return  getStaffMemberHandler(context);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Agency User",style: titleStyle,),
                 Consumer<GetStaffProvider>(builder: (context,staff,_){
                   return  staff.staff!.isNotEmpty?ListView.builder(
                       itemCount: staff.staff!.length,
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       primary: false,
                       itemBuilder: (BuildContext,index){
                         return GetStaffWidget(staffMember: staff.staff![index]);
                       }):Container(
                     alignment: Alignment.center,
                     height: MediaQuery.of(context).size.height/1.5,
                     child: Text("No Staff Available Against this User Exsists",style: headerStyle,),
                   );
                 })
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: kToolbarHeight * 1.0,
          width: double.infinity,
          child: CustomButton(
            horizontalMargin: 18.0,
            verticalMargin: 10.0,
            onTap: () {
              NavigationServices.goNextAndKeepHistory(context: context, widget: AddStaffUserScreen());
            },
            text: "Add User",
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

}
