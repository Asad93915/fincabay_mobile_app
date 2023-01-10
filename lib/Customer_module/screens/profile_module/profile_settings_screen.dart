import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/auth/screens/login_screen.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/Customer_module/cusomer_drawer_screen.dart';
import 'package:fincabay_application/Customer_module/services/delete_user_service.dart';
import 'package:fincabay_application/Customer_module/services/update_profile_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../helper_widgets/custom_dropdown_text.dart';
import '../../../helper_widgets/custom_profile_sheet_widget.dart';

class ProfileSettingsScreen extends StatefulWidget {
  final String userName;
  final String password;
  final String mobileNo;
  final String userId;
  final String userRole;
  final String email;


  ProfileSettingsScreen(
      {required this.userName,
      required this.password,
      required this.mobileNo,
      required this.userId,
      required this.userRole,
      required this.email});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  TextEditingController _nameCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  TextEditingController _mobileNoCont = TextEditingController();
  TextEditingController _bottomPasswordCont=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _nameCont.text = widget.userName;
    _passwordCont.text = widget.password;
    _mobileNoCont.text = widget.mobileNo;
    super.initState();
  }

  _updateProfileHandler() async {
    CustomLoader.showLoader(context: context);
    await UpdateCustomerProfileService().updateProfile(
      context: context,
      usedId: widget.userId,
      userEmail: widget.email,
      userRole: widget.userRole,
      name: _nameCont.text,
      password: _passwordCont.text,
      mobileNo: _mobileNoCont.text,
      isAgent: false,
      isActive: true,
    );
    CustomLoader.hideLoader(context);
  }

  _delUserHandler() async {
    CustomLoader.showLoader(context: context);
    _bottomPasswordCont.text==widget.password? await DeleteUserService()
        .delUser(context: context, userId: widget.userId):CustomSnackBar.failedSnackBar(context: context, message: "Password is not valid");
    CustomLoader.hideLoader(context);
    // if (res) {
    //   NavigationServices.goNextAndDoNotKeepHistory(
    //       context: context, widget: LoginScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode _currentFocus = FocusScope.of(context);
        _currentFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            "Profile Settings",
            style: titleStyle,
          ),
          leading: Builder(
            builder: (context) =>
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: blackColor,
                    )),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email:" + " ",
                          style: contactStyle,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 15.0,
                        ),
                        Text(" " + widget.email),
                      ],
                    ),
                  ),
                  Divider(
                    color: blackColor,
                    thickness: 0.6,
                  ),
                  CustomTextField(
                    headerText: "Name",
                    controller: _nameCont,
                  ),
                  CustomTextField(
                    headerText: "Password",
                    controller: _passwordCont,
                  ),
                  CustomDropDownText(
                    text: "Mobile Number",
                  ),
                  Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                    height: 45.0,
                    child: IntlPhoneField(
                      // controller: mobileNoCont,
                      // focusNode: noFocus,
                      dropdownTextStyle: ddStyle,
                      keyboardType: TextInputType.number,
                      style: countryStyle,
                      textInputAction: TextInputAction.next,
                      controller: _mobileNoCont,
                      autovalidateMode: AutovalidateMode.disabled,
                      // focusNode: _phoneFocus,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                            BorderSide(color: lightBlackColor, width: 1.5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: bgColor, width: 1.5)),
                      ),

                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                      initialCountryCode: "PK",
                    ),
                  ),
                  Divider(
                    color: blackColor,
                    thickness: 0.6,
                  ),
                  Text(
                    "ACCOUNT SETTINGS",
                    style: accountsStyle,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    title: Text(
                      "Delete this account",
                      style: loginStyle,
                    ),
                    subtitle: Text(
                        "If you delete your account your data will be removed."),
                    // trailing: CustomButton(
                    //   onTap: (){},
                    //   borderColor: Colors.red,
                    //   bgColor: Colors.white,
                    // ),
                    trailing: CustomIconButton(
                      onTap: () {
                        // _delUserHandler();
                        _settingModalBottomSheet(context);
                      },
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      fontSize: 14.0,
                      borderColor: Colors.red,
                      bgColor: whiteColor,
                      textColor: redColor,
                      iconColor: redColor,
                      fontWeight: FontWeight.w600,
                      icon: Icons.delete,
                      text: "Delete",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 5.0),
            height: kToolbarHeight * 1.0,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: black12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.5,
                  onTap: () {
                    _updateProfileHandler();
                  },
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  text: "Update Profile",
                ),
              ],
            )),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (BuildContext bc) {
          return ProfileBottomSheet(
            sureToDelText: "We are sorry to see you leave,Deleting you account will:",
            precautionsWidget:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CustomProfileSheetWidget(
              icon: Icons.checklist_outlined,
              titleText: "Remove all your listings",
            ),
            CustomProfileSheetWidget(
              icon: Icons.contact_page_outlined,
              titleText: "Remove all your account data",
            ),
            CustomProfileSheetWidget(
              icon: Icons.schedule,
              titleText: "Remove all your quoats and credit",
            ),

              ],
            ),
            delOnTap: (){
              Navigator.pop(context);
              _showDeleteBottomSheet(context);

            },
          );
        });
  }
  _showDeleteBottomSheet(context){

    showModalBottomSheet(context: context, builder: (context){
      return Scaffold(
        body: SingleChildScrollView(
          child: ProfileBottomSheet(
              sureToDelText: "Please confirm your password to delete your account permanently.",
              precautionsWidget:Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextField(
                      hintText: "Enter Password",
                      controller: _bottomPasswordCont,
                    ),
                    Text("Forgot Password?",style: iconStyle,),
                  ],
                ),
              ),
              delOnTap: (){
                _delUserHandler();
                setState(() {

                });
              }
          ),
        ),
      );
    });
  }


}


