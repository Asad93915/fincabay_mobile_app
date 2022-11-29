import 'dart:convert';

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/screens/get_all_agents_screen.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/dashboard_widgets/favourites_screen.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/home_dashboard_screens.dart';
import 'package:fincabay_application/customer_module/screens/profile_module/profile_screen.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/drawer_item_card.dart';
import 'package:fincabay_application/utils/Functions.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:fincabay_application/utils/variable_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  UserModel user=UserModel();


  int? selectedIndex;
  bool isLogin = false;
  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState

    getinitMethod();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final box=GetStorage();
    // UserModel? userModel= isLogin==true?UserModel.fromJson(box.read('user')):null;
    // print("User Model $userModel");
    return Container(
      padding: EdgeInsets.only(
        top: 30.0,
      ),
      color: barColor,
      width: MediaQuery.of(context).size.width / 1.4,
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
                    Image.asset(
                      "assets/images/fincabay_logo.jpg",
                      height: 50.0,
                    ),
                    Text(
                      "Fincabay.com",
                      style: logoStyle,
                    )
                  ],
                ),
                if (!isLoading)

                  isLogin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child
                                : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                                  child: Text(user.userName??"",style: nameStyle),
                                ),
                            flex: 1,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: bgColor,
                                )),
                          ],
                        )
                      : CustomButton(
                          width: MediaQuery.of(context).size.width,
                          horizontalMargin: 0.0,
                          verticalMargin: 10.0,
                          text: "Login Or Create Account",
                          textColor: bgColor,
                          fontSize: 16.0,
                          onTap: () {
                            NavigationServices.goNextAndKeepHistory(
                                context: context, widget: LoginScreen());
                          },
                          circularBorder: 10.0,
                          borderColor: bgColor,
                          bgColor: whiteColor,
                        )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
          Divider(
            thickness: 1.2,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 0 ? true : false,
            onTap: () {
              selectedIndex = 0;
              setState(() {
                NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen());
              });
            },
            title: "Home",
            icon: Icons.home,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 1 ? true : false,
            onTap: () async {
              isLogin = await getVisitorView();
              selectedIndex = 1;

              // isSelected==false? NavigationServices.goNextAndKeepHistory(context: context, widget: AddPropertyScreen()): NavigationServices.goNextAndKeepHistory(context: context, widget: LoginScreen());
              //
              // isSelected=false;
              if (isLogin == true) {
                NavigationServices.goNextAndKeepHistory(
                    context: context,
                    widget: AddPropertyScreen(

                      isSelected: false,
                      userEmail: user.email!,
                    ));
              } else {
                isLogin = false;
                setVisitorView(isLogin);
                print('is Selected $isLogin');

                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: LoginScreen());
              }
              setState(() {});
            },
            title: "Add Property",
            icon: Icons.add,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 2 ? true : false,
            onTap: () {
              selectedIndex = 2;
              // print("User Model $userModel");
              setState(() {});
            },
            title: "Search Property",
            icon: Icons.search_outlined,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 3 ? true : false,
            onTap: () {
              selectedIndex = 3;
              setState(() {});
            },
            title: "New Projects",
            icon: Icons.home_work_outlined,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 4 ? true : false,
            onTap: () {
              selectedIndex = 4;
              setState(() {
                NavigationServices.goNextAndKeepHistory(context: context, widget: FavouritesScreen(

                ));
              });
            },
            title: "Favourites",
            icon: CupertinoIcons.heart,
          ),
          DrawerItemCard(
            selctedColor: selectedIndex == 5 ? true : false,
            onTap: () {
              selectedIndex = 5;
              setState(() {});
            },
            title: "Saved Searches",
            icon: Icons.bookmark_border,
          ),
          // DrawerItemCard(
          //   selctedColor: selectedIndex == 6 ? true : false,
          //   onTap: () {
          //     selectedIndex = 6;
          //     NavigationServices.goNextAndKeepHistory(context: context, widget: ProfileScreen());
          //     setState(() {});
          //   },
          //   title: "User Profile",
          //   icon: Icons.person,
          // ),
          DrawerItemCard(
            selctedColor: selectedIndex == 6 ? true : false,
            onTap: () {
              selectedIndex = 6;
              NavigationServices.goNextAndKeepHistory(context: context, widget: GetAllAgentsScreen());
              setState(() {});
            },
            title: "Agents List",
            icon: Icons.person,
          ),
          Spacer(),
          DrawerItemCard(
            selctedColor: selectedIndex == 7 ? true : false,
            onTap: () async {
              // await box.remove('user');
              selectedIndex = 7;


              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();

              NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: LoginScreen());
              // print("User Name ${userModel!.userName!}");
              setState(() {});
            },
            title: "LogOut",
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }

   getSelectedValue() async {
    // CustomLoader.showLoader(context: context);
    isLogin = await getVisitorView();
    // CustomLoader.hideLoader(context);
    isLoading = false;
    setState(() {});
  }
  // getUser()async{
  //
  //   String getUser=await LocaleStorageServices().getUser();
  //   user=UserModel.fromJson(jsonDecode(getUser));
  //   print("user Name testing ${user.name}");
  // }
  getinitMethod()async{
    await getSelectedValue();

    if(isLogin==true){
     user=await getUser();
    }

  }

}
