

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/screens/auth/login_screen.dart';
import 'package:fincabay_application/services/registration_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../helper_widgets/custom_dropdown_text.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  registrationHandler()async{
    CustomLoader.showLoader(context: context);
    bool res=await RegistrationService().registerUser(context: context, userName: nameCont.text, email: emailCont.text, mobileNo: mobileNoCont.text, password: passwordCont.text);
    CustomLoader.hideLoader(context);
    if(res){
      NavigationServices.goNextAndKeepHistory(context: context, widget: LoginScreen());
    }
  }


  TextEditingController nameCont=TextEditingController();
  TextEditingController emailCont=TextEditingController();
  TextEditingController mobileNoCont=TextEditingController();
  TextEditingController passwordCont=TextEditingController();
  TextEditingController confirmPasswordCont=TextEditingController();


  FocusNode nameFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
  FocusNode noFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();
  FocusNode confirmPasswordFocus=FocusNode();

  String _selectedCity="";
  List<String> _cityList=["Lahore","Islamabad","Karachi"];
  String _selectedCountry="";
  List<String>_countriesList=["Pakistan","India","China","Austrails"];
  String _selectedSigningUp="";
  List<String> _signingUpAsList=["User","Admin",];
  bool _isChecked=false;
  String _selectedDealCity="";
  List<String> _dealCityList=["Muree","Multan","Lahore"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode _cureentFocus=FocusScope.of(context);
        _cureentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text("Registration",style: barStyle,),
        centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register",style: titleStyle,),
                CustomTextField(
                  headerText: "Name",
                  inputAction: TextInputAction.next,
                  controller: nameCont,
                  focusNode: nameFocus,
                ),
                CustomTextField(
                  headerText: "Email",
                  controller:  emailCont,
                  focusNode: emailFocus,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                ),
                CustomTextField(
                  headerText: "Password",
                  controller: passwordCont,
                  focusNode: passwordFocus,
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                ),
                CustomTextField(
                  headerText: "Confirm Password",
                  controller: confirmPasswordCont,
                  focusNode: confirmPasswordFocus,
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                ),
                CustomDropDownText(
                  text: "Mobile Number",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
                  height: 45.0,
                  child: IntlPhoneField(
                    controller: mobileNoCont,
                    focusNode: noFocus,
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
                          borderSide: BorderSide(
                              color: lightBlackColor,width: 1.5
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: bgColor,
                              width: 1.5
                          )
                      ),
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


               //  CustomTextField(
               //    headerText: "Phone",
               //    inputType: TextInputType.phone,
               //    inputAction: TextInputAction.next,
               //    charLength: 13,
               //  ),
               //
               //  CustomDropDownText(
               //    text: "City",
               //  ),
               //  Container(
               //    padding: EdgeInsets.symmetric(horizontal: 5.0),
               //    margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
               //    height: 45.0,
               //    decoration: BoxDecoration(
               //      borderRadius: BorderRadius.circular(12.0),
               //      border: Border.all(color: _selectedCity.isEmpty?lightBlackColor:bgColor,width: 1.5)
               //    ),
               //    child: DropdownButton(
               //      isExpanded: true,
               //        underline: SizedBox(),
               //        hint: Text(_selectedCity.isEmpty?"-- Select City --":_selectedCity,style:labelStyle2,),
               //        items: _cityList.map((item){
               //      return DropdownMenuItem(
               //        value: item,
               //        child: Text(item),
               //      );
               //    } ).toList(),
               //        onChanged: (String? value){
               //      _selectedCity=value!;
               //      setState((){});
               //        }),
               //  ),
               //  CustomDropDownText(
               //    text: "Country",
               //  ),
               //
               //  Container(
               //    padding: EdgeInsets.symmetric(horizontal: 8.0),
               //    margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
               //    height: 45.0,
               //    decoration: BoxDecoration(
               //      borderRadius: BorderRadius.circular(12.0),
               //      border: Border.all(color: _selectedCountry.isEmpty?lightBlackColor:bgColor,width: 1.5)
               //    ),
               //    child: DropdownButton(
               //      isExpanded: true,
               //        underline: SizedBox(),
               //        hint: Text(_selectedCountry.isEmpty?"-- Select Country --":_selectedCountry,style:labelStyle2,),
               //        items: _countriesList.map((item){
               //      return DropdownMenuItem(
               //        value: item,
               //        child: Text(item),
               //      );
               //    } ).toList(),
               //        onChanged: (String? value){
               //      _selectedCountry=value!;
               //      setState((){});
               //        }),
               //  ),
               //  CustomDropDownText(
               //    text: "Signing_up",
               //  ),
               //  Container(
               //
               //    padding: EdgeInsets.symmetric(horizontal: 8.0),
               //    margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
               //    height: 45.0,
               //    decoration: BoxDecoration(
               //        borderRadius: BorderRadius.circular(12.0),
               //      border: Border.all(
               //        color: _selectedSigningUp.isEmpty?lightBlackColor:bgColor,width: 1.5,
               //      )
               //    ),
               //    child: DropdownButton(
               //      isExpanded: true,
               //        underline: SizedBox(),
               //        hint: Text(_selectedSigningUp.isEmpty?"-- Signing up as --":_selectedSigningUp),
               //        items: _signingUpAsList.map((item){
               //      return DropdownMenuItem(
               //        value: item,
               //        child: Text(item,),
               //      );
               //    } ).toList(),
               //        onChanged: (String? value){
               //      _selectedSigningUp=value!;
               //      setState((){});
               //        }),
               //  ),
               //  CheckboxListTile(
               //    contentPadding: EdgeInsets.all(0.0),
               //    controlAffinity: ListTileControlAffinity.leading,
               //    title: Text("Are you an agent"),
               //    value: _isChecked, onChanged: (bool? value){
               //    _isChecked=value!;
               //    setState((){});
               //  },
               //  ),
               //  CustomTextField(
               //    headerText: "Agency Name",
               //  ),
               //  CustomDropDownText(
               //    text: "Deal_City",
               //  ),
               //  Container(
               //
               //    padding: EdgeInsets.symmetric(horizontal: 8.0),
               //    margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
               //    height: 45.0,
               //    decoration: BoxDecoration(
               //        borderRadius: BorderRadius.circular(12.0),
               //        border: Border.all(
               //          color: _selectedDealCity.isEmpty?lightBlackColor:bgColor,width: 1.5,
               //        )
               //    ),
               //    child: DropdownButton(
               //        isExpanded: true,
               //        underline: SizedBox(),
               //        hint: Text(_selectedDealCity.isEmpty?"-- Select City --":_selectedDealCity),
               //        items: _dealCityList.map((item){
               //          return DropdownMenuItem(
               //            value: item,
               //            child: Text(item,),
               //          );
               //        } ).toList(),
               //        onChanged: (String? value){
               //          _selectedDealCity=value!;
               //          setState((){});
               //        }),
               //  ),
               //  CustomDropDownText(
               //    text: "Deal_MobileNumber",
               //  ),
               //  Container(
               //    margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
               //    height: 45.0,
               //    child: IntlPhoneField(
               //      dropdownTextStyle: ddStyle,
               //      keyboardType: TextInputType.number,
               //      style: countryStyle,
               //      textInputAction: TextInputAction.next,
               //      // controller: _phoneNoCont,
               //      autovalidateMode: AutovalidateMode.disabled,
               //      // focusNode: _phoneFocus,
               //      decoration: InputDecoration(
               //
               //        contentPadding:
               //        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
               //        counterText: "",
               //        enabledBorder: OutlineInputBorder(
               //            borderRadius: BorderRadius.circular(12.0),
               //            borderSide: BorderSide(
               //                color: lightBlackColor,width: 1.5
               //            )
               //        ),
               //        focusedBorder: OutlineInputBorder(
               //            borderRadius: BorderRadius.circular(12.0),
               //            borderSide: BorderSide(
               //                color: bgColor,
               //                width: 1.5
               //            )
               //        ),
               //      ),
               //
               //      onChanged: (phone) {
               //        print(phone.completeNumber);
               //      },
               //      onCountryChanged: (country) {
               //        print('Country changed to: ' + country.name);
               //      },
               //      initialCountryCode: "PK",
               //
               //    ),
               //  ),
               //  CustomTextField(
               //   headerText: "Company_Phone",
               //   inputAction: TextInputAction.next,
               //    inputType: TextInputType.phone,
               //    charLength: 13,
               // ),
               //  CustomTextField(
               //   headerText: "Company_Fax",
               //   inputAction: TextInputAction.next,
               // ),
               //  CustomTextField(
               //   headerText: "Company_Email",
               //   inputType: TextInputType.emailAddress,
               //   inputAction: TextInputAction.next,
               // ),
               //  CustomTextField(
               //    headerText: "Service_Description",
               //    maxLine: 3,
               //  ),
                CustomButton(
                  horizontalMargin: 8.0,
                  verticalMargin: 10.0,
                  onTap: (){
                    if(validateRegistration()){
                      registrationHandler();
                    }
                  },
                  text: "Submit",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  validateRegistration(){
    if(nameCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "User Name is Empty");
      nameFocus.requestFocus();
      return false;
    }
    else if(emailCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter valid Email");
      emailFocus.requestFocus();
      return false;
    }
    else if(passwordCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter valid Password");
      passwordFocus.requestFocus();
      return false;
    }
    else if(confirmPasswordCont.text != passwordCont.text){
      CustomSnackBar.failedSnackBar(context: context, message: "Password should be Match");
      confirmPasswordFocus.requestFocus();
      return false;
    }
    else if(mobileNoCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Mobile Number");
      noFocus.requestFocus();
      return false;
    }
    else{
      return true;
    }
  }
}
