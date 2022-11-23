import 'package:fincabay_application/Agents_module/screens/agents_drawer_screen.dart';
import 'package:fincabay_application/Agents_module/services/update_agent_profile_service.dart';
import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/auth/screens/login_screen.dart';
import 'package:fincabay_application/auth/services/registration_service.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/services/update_profile_service.dart';
import 'package:fincabay_application/dialogs/show_will_pop_dialog.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../customer_module/providers/cities_provider.dart';
import '../../helper_widgets/custom_dropdown_text.dart';
import '../../helper_widgets/custom_form_field.dart';
import '../../utils/handlers.dart';

class UpdateAgentProfileScreen extends StatefulWidget {
  final String userName;
  final String password;
  final String userEmail;
  final String mobileNo;
  final String city;
  final String agencyName;
  final String compFax;
  final String serviceDescription;

  UpdateAgentProfileScreen({required this.userName, required this.userEmail, required this.mobileNo, required this.city, required this.agencyName, required this.compFax, required this.serviceDescription, required this.password});

  @override
  State<UpdateAgentProfileScreen> createState() =>
      _UpdateAgentProfileScreenState();
}

class _UpdateAgentProfileScreenState extends State<UpdateAgentProfileScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController passwordCont=TextEditingController();
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController agencyNameCont = TextEditingController();
  TextEditingController companyFaxCont = TextEditingController();
  TextEditingController descriptionCont = TextEditingController();


  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus=FocusNode();
  FocusNode noFocus = FocusNode();
  FocusNode agencyNameFocus = FocusNode();
  FocusNode companyFaxFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      citiesHandler(context);
      nameCont.text = widget.userName;
      passwordCont.text=widget.password;
      mobileNoCont.text=widget.mobileNo;
      agencyNameCont.text=widget.agencyName;
      companyFaxCont.text=widget.compFax;
      descriptionCont.text=widget.serviceDescription;

      setState(() {});
    });
    super.initState();
  }

  updateAgentProfileHandler()async{
    CustomLoader.showLoader(context: context);
    await UpdateAgentProfileService().updateAgentProfile(
        context: context,
        userId: "a62eea97-50da-4cca-98d0-7537268596f3",
        userEmail: widget.userEmail,
        password: passwordCont.text,
        userRole: "Agent",
        name: nameCont.text,
        mobileNo: mobileNoCont.text,
        city: _selectedCity.toString(),
        country: _selectedCountry,
        agencyName: agencyNameCont.text,
        compFax: companyFaxCont.text,
        serviceDescription: descriptionCont.text,
        isAgent: true,
        isActive: true);
    CustomLoader.hideLoader(context);
  }

  String? _selectedCity;

  @override
  void updateCity(String value) {
    setState(() {
      _selectedCity = value;
    });
  }

  // String? _selectedDealCity;

  // @override
  // void updateDealCity(String value) {
  //   setState(() {
  //     _selectedDealCity = value;
  //   });
  // }

  String _selectedCountry = "";
  List<String> _countriesList = ["Pakistan"];




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode _cureentFocus = FocusScope.of(context);
        _cureentFocus.unfocus();
      },
      child: Scaffold(
        drawer: AgentsDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          ),
          backgroundColor: bgColor,
          title: Text(
            "Update Profile",
            style: barStyle,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Text(" " + widget.userEmail),
                  ],
                ),
                CustomTextField(
                  headerText: "Name",
                  inputAction: TextInputAction.next,
                  controller: nameCont,
                  focusNode: nameFocus,
                ),
                CustomTextField(
                  headerText: "Password",
                  inputAction: TextInputAction.next,
                  controller: passwordCont,
                  focusNode: passwordFocus,
                ),
                CustomDropDownText(
                  text: "Mobile Number",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
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
                CustomDropDownText(
                  text: "City",
                ),
                Consumer<CitiesProvider>(builder: (context, cities, _) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                    height: 45.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                            color: _selectedCity == null
                                ? lightBlackColor
                                : bgColor,
                            width: 1.5)),
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _selectedCity,
                        hint: Text(
                          "--Select City--",
                          style: labelStyle2,
                        ),
                        items: cities.city!.toSet().map((item) {
                          return DropdownMenuItem(
                            value: item.cityName,
                            child: Text(item.cityName!),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          print("Asad");
                          if (updateCity != null) {
                            updateCity(newValue!);
                          }
                          setState(() {});
                        }),
                  );
                }),
                CustomDropDownText(
                  text: "Country",
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                  height: 45.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: _selectedCountry.isEmpty
                              ? lightBlackColor
                              : bgColor,
                          width: 1.5)),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text(
                        _selectedCountry.isEmpty
                            ? "-- Select Country --"
                            : _selectedCountry,
                        style: labelStyle2,
                      ),
                      items: _countriesList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        _selectedCountry = value!;
                        setState(() {});
                      }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      headerText: "Agency Name",
                      controller: agencyNameCont,
                      focusNode: agencyNameFocus,
                      inputAction: TextInputAction.next,
                    ),
                    // CustomDropDownText(
                    //   text: "Deal_City",
                    // ),
                    // Consumer<CitiesProvider>(builder: (context, cities, _) {
                    //   return Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 5.0),
                    //     margin: EdgeInsets.symmetric(
                    //         horizontal: 6.0, vertical: 8.0),
                    //     height: 45.0,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12.0),
                    //         border: Border.all(
                    //             color: _selectedDealCity == null
                    //                 ? lightBlackColor
                    //                 : bgColor,
                    //             width: 1.5)),
                    //     child: DropdownButton(
                    //         isExpanded: true,
                    //         underline: SizedBox(),
                    //         value: _selectedDealCity,
                    //         hint: Text(
                    //           "--Select City--",
                    //           style: labelStyle2,
                    //         ),
                    //         items: cities.city!.toSet().map((item) {
                    //           return DropdownMenuItem(
                    //             value: item.cityName,
                    //             child: Text(item.cityName!),
                    //           );
                    //         }).toList(),
                    //         onChanged: (String? newValue) {
                    //           print("Asad");
                    //           if (updateDealCity != null) {
                    //             updateDealCity(newValue!);
                    //           }
                    //           setState(() {});
                    //         }),
                    //   );
                    // }),
                    // CustomDropDownText(
                    //   text: "Deal_MobileNumber",
                    // ),
                    // Container(
                    //   margin:
                    //       EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                    //   height: 45.0,
                    //   child: IntlPhoneField(
                    //     dropdownTextStyle: ddStyle,
                    //     keyboardType: TextInputType.number,
                    //     style: countryStyle,
                    //     textInputAction: TextInputAction.next,
                    //     // controller: _phoneNoCont,
                    //     autovalidateMode: AutovalidateMode.disabled,
                    //     // focusNode: _phoneFocus,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 10.0, vertical: 0.0),
                    //       counterText: "",
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12.0),
                    //           borderSide: BorderSide(
                    //               color: lightBlackColor, width: 1.5)),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12.0),
                    //           borderSide:
                    //               BorderSide(color: bgColor, width: 1.5)),
                    //     ),
                    //
                    //     onChanged: (phone) {
                    //       print(phone.completeNumber);
                    //     },
                    //     onCountryChanged: (country) {
                    //       print('Country changed to: ' + country.name);
                    //     },
                    //     initialCountryCode: "PK",
                    //   ),
                    // ),
                    // CustomTextField(
                    //   headerText: "Company_Phone",
                    //   inputAction: TextInputAction.next,
                    //   inputType: TextInputType.phone,
                    //   charLength: 13,
                    //   controller: companyPhoneCont,
                    //   focusNode: companyPhoneFocus,
                    // ),
                    CustomTextField(
                      headerText: "Company_Fax",
                      inputAction: TextInputAction.next,
                      controller: companyFaxCont,
                      focusNode: companyFaxFocus,
                    ),
                    // CustomTextField(
                    //   headerText: "Company_Email",
                    //   inputType: TextInputType.emailAddress,
                    //   inputAction: TextInputAction.next,
                    //   controller: companyEmailCont,
                    //   focusNode: companyEmailFocus,
                    // ),
                    CustomTextField(
                      headerText: "Service_Description",
                      maxLine: 3,
                      inputAction: TextInputAction.next,
                      controller: descriptionCont,
                      focusNode: descriptionFocus,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: kToolbarHeight * 1.0,
          child: CustomButton(
            horizontalMargin: 18.0,
            verticalMargin: 10.0,
            onTap: ()async {
            await  updateAgentProfileHandler();
              NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
              setState((){});
            },
            text: "Submit",
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

}
