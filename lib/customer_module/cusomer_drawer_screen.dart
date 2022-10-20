
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/drawer_item_card.dart';
import 'package:fincabay_application/utils/variable_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/screens/login_screen.dart';
import '../auth/models/user_response_model.dart';
import 'screens/add_property_screen.dart';


class CustomDrawer extends StatefulWidget {

  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int?selectedIndex;
  bool isSelected=true;
bool isloading=true;

  @override
  void initState() {
    // TODO: implement initState
    getSelectedValue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    UserModel userModel = UserModel.fromJson(box.read('user'));
    return Container(
      padding: EdgeInsets.only(top: 30.0,),
      color: barColor,
      width: MediaQuery.of(context).size.width/1.4,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 12.0),
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

if(!isloading) isSelected?Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(userModel.userName!,style: nameStyle),
    IconButton(onPressed: (){

    }, icon: Icon(Icons.arrow_forward_outlined,color: bgColor,)),
  ],
):
CustomButton(
  width: MediaQuery.of(context).size.width,
  horizontalMargin: 0.0,
  verticalMargin: 10.0,
  text: "Login Or Create Account",
  textColor: bgColor,
  fontSize: 16.0,
  onTap: (){
    NavigationServices.goNextAndKeepHistory(context: context, widget: LoginScreen());
  },
  circularBorder: 10.0,
  borderColor: bgColor,
  bgColor: whiteColor,

)else const CircularProgressIndicator(),



           ],
         ),
       ),
          Divider(
           thickness: 1.2,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==0?true:false,
            onTap: (){
              selectedIndex=0;
              setState((){});
            },
            title: "Home",
            icon: Icons.home,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==1?true:false,
            onTap: ()async{
             isSelected=await getVisitorView();
              selectedIndex=1;

             // isSelected==false? NavigationServices.goNextAndKeepHistory(context: context, widget: AddPropertyScreen()): NavigationServices.goNextAndKeepHistory(context: context, widget: LoginScreen());
             //
             // isSelected=false;
              if(isSelected==true){
                NavigationServices.goNextAndKeepHistory(context: context, widget: AddPropertyScreen(
                  isSelected:false,
                ));

              }
              else{
                isSelected=false;
                setVisitorView(isSelected);
                print('is Selected $isSelected');
                  NavigationServices.goNextAndKeepHistory(context: context, widget: LoginScreen());

              }
              setState((){});
            },
            title: "Add Property",
            icon: Icons.add,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==2?true:false,
            onTap: (){
              selectedIndex=2;
              setState((){});
            },
            title: "Search Property",
            icon: Icons.search_outlined,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==3?true:false,
            onTap: (){
              selectedIndex=3;
              setState((){});
            },
            title: "New Projects",
            icon: Icons.home_work_outlined,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==4?true:false,
            onTap: (){
              selectedIndex=4;
              setState((){});
            },
            title: "Favourites",
            icon: CupertinoIcons.heart,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex==5?true:false,
            onTap: (){
              selectedIndex=5;
              setState((){});
            },
            title: "Saved Searches",
            icon: Icons.bookmark_border,
          ),
          Spacer(),
          DrawerItemCard(
            selctedColor: selectedIndex==6?true:false,
            onTap: ()async{
              selectedIndex=6;
              SharedPreferences pref=await SharedPreferences.getInstance();
              pref.clear();
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
              setState((){});
            },
            title: "LogOut",
            icon: Icons.logout,
          ),
        ],

      ),
    );
  }

  void getSelectedValue() async{

    // CustomLoader.showLoader(context: context);
    isSelected=await getVisitorView();
    // CustomLoader.hideLoader(context);
    isloading=false;
    setState((){});

  }
}
