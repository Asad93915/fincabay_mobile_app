import 'package:fincabay_application/Agents_module/screens/staff/agency_staff_screen.dart';
import 'package:fincabay_application/Agents_module/services/add_staff_member_service.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_text_field.dart';
import '../../../utils/handlers.dart';

class AddStaffUserScreen extends StatefulWidget {
  final String agentEmail;
  const AddStaffUserScreen({Key? key, required this.agentEmail}) : super(key: key);

  @override
  State<AddStaffUserScreen> createState() => _AddStaffUserScreenState();
}

class _AddStaffUserScreenState extends State<AddStaffUserScreen> {
  _addAgencyStaff() async {
    CustomLoader.showLoader(context: context);
    await AddStaffMemberService().addStaffMember(
        context: context,
        agentEmail:widget.agentEmail,
        name: _contactPersonCont.text,
        staffEmail: _emailCont.text,
        mobileNo: _mobileNoCont.text,
        password: _passwordCont.text,
        address: _addressCont.text,
        isActive: true,
        roleName: "Staff");
    CustomLoader.hideLoader(context);
  }

  TextEditingController _contactPersonCont = TextEditingController();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  TextEditingController _addressCont = TextEditingController();
  TextEditingController _mobileNoCont = TextEditingController();

  FocusNode _contactPersonFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  FocusNode _mobileNoFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Add Users",
          style: barStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add User",
                  style: userStyle,
                ),
                CustomTextField(
                  headerText: "Contact Person",
                  controller: _contactPersonCont,
                  focusNode: _contactPersonFocus,
                  inputAction: TextInputAction.next,
                ),
                CustomTextField(
                  headerText: "Email",
                  controller: _emailCont,
                  focusNode: _emailFocus,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  headerText: "Password",
                  controller: _passwordCont,
                  focusNode: _passwordFocus,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.visiblePassword,
                ),
                CustomTextField(
                  headerText: "Mobile Number",
                  controller: _mobileNoCont,
                  focusNode: _mobileNoFocus,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.phone,
                ),
                CustomTextField(
                  headerText: "Address",
                  controller: _addressCont,
                  focusNode: _addressFocus,
                  inputAction: TextInputAction.next,
                ),
                CustomButton(
                  text: "SUBMIT",
                  width: double.infinity,
                  verticalMargin: 10.0,
                  horizontalMargin: 8.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  bgColor: bgColor,
                  textColor: whiteColor,
                  onTap: () async {
                    await _addAgencyStaff();
                    NavigationServices.goNextAndKeepHistory(
                        context: context, widget: AgencyStaffScreen(agentEmail: widget.agentEmail,));
                    // Navigator.pop(context);
                    getStaffMemberHandler(context,widget.agentEmail);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validateUserForm() async {
    if (_contactPersonCont.text.isEmpty) {
      CustomSnackBar.showTopSnackBar(
          context: context, message: "Person name can't be empty");
      _contactPersonFocus.requestFocus();
      return false;
    } else if (_emailCont.text.isEmpty) {
      CustomSnackBar.showTopSnackBar(
          context: context, message: "Email can't be empty");
      _emailFocus.requestFocus();
      return false;
    } else if (_passwordCont.text.isEmpty) {
      CustomSnackBar.showTopSnackBar(
          context: context, message: "Password can't be empty");
      _passwordFocus.requestFocus();
      return false;
    } else if (_mobileNoCont.text.isEmpty) {
      CustomSnackBar.showTopSnackBar(
          context: context, message: "Mobile Number can't be empty");
      _mobileNoFocus.requestFocus();
      return false;
    } else if (_addressCont.text.isEmpty) {
      CustomSnackBar.showTopSnackBar(
          context: context, message: "Address can't be empty");
      _addressFocus.requestFocus();
      return false;
    }
  }
}
