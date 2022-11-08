import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/cusomer_drawer_screen.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../helper_widgets/custom_dropdown_text.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                CustomTextField(
                  headerText: "Name",
                ),
                CustomTextField(
                  headerText: "Email",
                ),
                CustomTextField(
                  headerText: "Password",
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
                    // controller: _phoneNoCont,
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
              onTap: (){},
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              text: "Update Profile",
            ),
          ],
        )
      ),
    );
  }
}
