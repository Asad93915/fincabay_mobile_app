import 'package:fincabay_application/Agents_module/screens/staff/agency_staff_screen.dart';
import 'package:fincabay_application/Agents_module/services/edit_staff_member_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/text_styles.dart';
import '../helper_widgets/custom_button.dart';
import '../helper_widgets/custom_form_field.dart';
import '../helper_widgets/custom_text_field.dart';
import '../utils/handlers.dart';

class EditStaffMemberDialog extends StatefulWidget {
  final String contactName;
  final String password;
  final String address;
  final String mobileNo;
  final String email;
  final int id;
  final String agentEmail;


  EditStaffMemberDialog(
      {required this.contactName,
      required this.password,
      required this.address,
      required this.mobileNo,
      required this.email,
      required this.agentEmail,
      required this.id});

  @override
  State<EditStaffMemberDialog> createState() => _EditStaffMemberDialogState();
}

class _EditStaffMemberDialogState extends State<EditStaffMemberDialog> {
  String? contact;
  String? password;
  String? address;
  String? no;

  updateStaffHandler() async {
    CustomLoader.showLoader(context: context);
    await EditStaffMemberService().editStaff(
        context: context,
        contactName: contact ?? widget.contactName,
        email: widget.email,
        password: password ?? widget.password,
        address: address ?? widget.address,
        mobileNo: no ?? widget.mobileNo,
        agentEmail: widget.agentEmail,
        id: widget.id
    );
    CustomLoader.hideLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Staff",
                    style: userStyle,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              CustomFormField(
                initValue: widget.contactName,
                headerText: "Contact Person",
                onChange: (value) {
                  contact = value;
                  setState(() {});
                },
              ),
              CustomFormField(
                initValue: widget.password,
                headerText: "Password",
                onChange: (value) {
                  password = value;
                },
              ),
              CustomFormField(
                initValue: widget.address,
                headerText: "Address",
                onChange: (value) {
                  address = value;
                },
              ),
              CustomFormField(
                headerText: "Mobile Number",
                initValue: widget.mobileNo,
                onChange: (value) {
                  no = value;
                },
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
                onTap: ()async {
                 await updateStaffHandler();
                  await getStaffMemberHandler(context,widget.agentEmail);
                  Navigator.pop(context);
                  // NavigationServices.goNextAndKeepHistory(context: context, widget: AgencyStaffScreen());

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
