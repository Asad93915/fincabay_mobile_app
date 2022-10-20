import 'package:fincabay_application/Agents_module/screens/agents_drawer_screen.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../helper_widgets/custom_button.dart';
class AgencyStaffScreen extends StatefulWidget {
  const AgencyStaffScreen({Key? key}) : super(key: key);

  @override
  State<AgencyStaffScreen> createState() => _AgencyStaffScreenState();
}

class _AgencyStaffScreenState extends State<AgencyStaffScreen> {
  List<String> usersList=["Asad","Usman","Asim"];
  List<String> emailList=["developer@gmail.com","tester@gmail.com","clien@gmail.com"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AgentsDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
    }, icon: Icon(Icons.menu),)),
        centerTitle: true,
        backgroundColor: bgColor,
        title: Text("Agency Staff",style: barStyle,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Agency User",style: titleStyle,),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  itemBuilder: (BuildContext,index){
                return Card(
                  elevation: 3.0,
                  margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contact Person",style: contactStyle,),
                        Text(usersList[index]),
                        Text("Email",style: contactStyle,),
                        Text(emailList[index]),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Team",style: contactStyle),
                            Text("Listing",style: contactStyle),
                            Text("Leads",style: contactStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text("6"),flex: 1,),

                            Expanded(child: Text("Bahria Town"),flex: 2,),

                            Expanded(child: Text("5"),flex: 0,),
                          ],
                        ),
                        Divider(
                          color: black26,
                          thickness: 1.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Actions",style: contactStyle,),
                            Spacer(),
                            Icon(Icons.edit,color: bgColor,),
                            Container(
                              width: 1.5,
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              height:MediaQuery.of(context).size.height/30,
                              color: blackColor,
                            ),
                            Icon(Icons.delete,color: bgColor,)
                          ],
                        )


                      ],
                    ),
                  ),

                );
              })
              ],
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

          },
          text: "Add User",
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          width: double.infinity,
        ),
      ),
    );
  }
}
