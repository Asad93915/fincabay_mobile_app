import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/cusomer_drawer_screen.dart';
import 'package:fincabay_application/customer_module/services/update_profile_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../helper_widgets/custom_dropdown_text.dart';

class ProfileSettingsScreen extends StatefulWidget {
  final String userName;
  final String password;
  final String mobileNo;
  final String userId;
  final String userRole;
  final String email;
   ProfileSettingsScreen({required this.userName, required this.password, required this.mobileNo, required this.userId, required this.userRole, required this.email}) ;

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  TextEditingController _nameCont=TextEditingController();
  TextEditingController _passwordCont=TextEditingController();
  TextEditingController _mobileNoCont=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _nameCont.text=widget.userName;
    _passwordCont.text=widget.password;
    _mobileNoCont.text=widget.mobileNo;
    super.initState();
  }

  _updateProfileHandler()async{
    CustomLoader.showLoader(context: context);
    await UpdateAgentProfileService().updateProfile(
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode _currentFocus=FocusScope.of(context);
        _currentFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text("Profile Settings",style: titleStyle,),
          leading: Builder(
            builder: (context) =>
                IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu,color: blackColor,)),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
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
                    margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
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
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
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

                  Text("ACCOUNT SETTINGS",style: accountsStyle,),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    title: Text("Delete this account",style: loginStyle,),
                    subtitle: Text("If you delete your account your data will be removed."),
                    // trailing: CustomButton(
                    //   onTap: (){},
                    //   borderColor: Colors.red,
                    //   bgColor: Colors.white,
                    // ),
                    trailing: CustomIconButton(
                      onTap: (){},
                      width: MediaQuery.of(context).size.width/3,
                      fontSize: 14.0,
                      borderColor: Colors.red,
                      bgColor: whiteColor,
                      textColor: redColor,
                      iconColor: redColor,
                      fontWeight: FontWeight.w600,
                      icon:Icons.delete,
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
          decoration: BoxDecoration(
            border: Border.all(color: black12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                width: MediaQuery.of(context).size.width/1.5,
                onTap: (){
                  _updateProfileHandler();
                },
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                text: "Update Profile",
              ),
            ],
          )
        ),
      ),
    );
  }
}
