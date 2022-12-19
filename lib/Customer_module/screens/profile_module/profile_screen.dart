
import 'dart:convert';

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/Customer_module/models/get_user_properties_model.dart';
import 'package:fincabay_application/Customer_module/screens/profile_module/about_us_screen.dart';
import 'package:fincabay_application/Customer_module/screens/profile_module/get_user_properties_screen.dart';
import 'package:fincabay_application/Customer_module/screens/profile_module/profile_settings_screen.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:fincabay_application/utils/variable_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../auth/models/user_response_model.dart';
import '../../../auth/screens/login_screen.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../helper_widgets/custom_profile_widget.dart';
import '../home_dashboard/properties_widgets/add_property_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isLogin=false;
  UserModel user=UserModel();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
   getInitServices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final box=GetStorage();

    // UserModel? user=isLogin==true?UserModel.fromJson(box.read('user')):null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isLoading)
          isLogin?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Profile",style: profileStyle,),
              Text(user.userName==null?"":user.userName!),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomProfileWidget(
                      profileText: "Profile\nSettings",
                      icon: Icons.settings,
                      onTap: (){
                        NavigationServices.goNextAndKeepHistory(context: context, widget: ProfileSettingsScreen(
                          userName: user.name??"",
                          password: user.password??"",
                          mobileNo: user.phoneNumber??"",
                          userId: user.id??"",
                          userRole: user.roleName??"",
                          email: user.email??"",
                        ));
                      },
                      selectedColor: false,
                    ),
                    CustomProfileWidget(
                      profileText: "My\nProperties",
                      icon: CupertinoIcons.home,
                      onTap: (){
                        NavigationServices.goNextAndKeepHistory(context: context, widget: GetUserPropertiesScreen(
                          userEmail: user.email!,
                        ));
                      },
                      selectedColor: false,
                    ),
                    CustomProfileWidget(
                      profileText: "Drafts",
                      icon: Icons.drafts,
                      onTap: (){},
                      selectedColor: false,
                    ),
                  ],
                ),
              ),

              Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  margin: EdgeInsets.only(top: 30.0,bottom: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: black12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/add_property.jpg",height:MediaQuery.of(context).size.height / 10,width: 80.0,fit: BoxFit.fill,),

                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 10.0),
                                child: Text("Looking to sell or rent\nout your property?",style: addPropStyle,),
                              ))
                            ],
                          ),
                        ),

                        CustomButton(
                          onTap: (){
                            NavigationServices.goNextAndKeepHistory(context: context, widget: AddPropertyScreen(
                              isSelected: false,
                              userEmail: user.email!,
                            ));
                          },
                          height: 40.0,
                          bgColor: postColor,
                          verticalMargin: 12.0,
                          horizontalMargin: 20.0,
                          width: double.infinity,
                          text: "Post an Ad",
                        )
                      ],
                    ),
                  )
              ),
            ],
          ):
              ListTile(
                onTap: ()async{
                  isLogin=await getVisitorView();
                  if(isLogin==true)
                  {
                    print("Okay");
                    // NavigationServices.goNextAndKeepHistory(
                    //     context: context,
                    //     widget: AddPropertyScreen(
                    //
                    //       isSelected: false,
                    //     ));
                  }
                  else{
                    isLogin = false;
                    setVisitorView(isLogin);
                    print('is Selected $isLogin');
                    NavigationServices.goNextAndKeepHistory(
                        context: context, widget: LoginScreen());
                  }

                  print("Is Login $isLogin");
                },
                title: Text("Log in"),
                subtitle: Text("Log in to your account",style: lessStyle,),
                trailing: Image.asset("assets/icons/account_icon.png"),
              ),
          ListTile(
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: AboutUSScreen());
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          TextButton.icon(onPressed: (){
            NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());

          }, icon: Icon(Icons.logout), label: Text("Log Out"))

        ],
      ),
    );
  }
   getSelectedValue() async {
    // CustomLoader.showLoader(context: context);
    print("Calling ");
    isLogin = await getVisitorView();
    print("aaaaaa$isLogin");
    // CustomLoader.hideLoader(context);
    isLoading = false;
    setState(() {});
  }
 getUser()async{
    String getUser=await LocaleStorageServices().getUser();
    user=UserModel.fromJson(jsonDecode(getUser));
    print("${user.userName}");

  }

   getInitServices()async {
   await getSelectedValue();
    print("Is Login $isLogin");

    if(isLogin==true){

     await getUser();
      print("User Name ${user.name}");
    }
  }
}
