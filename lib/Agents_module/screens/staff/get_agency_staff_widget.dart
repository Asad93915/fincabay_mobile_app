
import 'package:fincabay_application/Agents_module/models/get_all_staff_member_model.dart';
import 'package:fincabay_application/Agents_module/services/delete_agency_staff_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../dialogs/edit_staff_member_dialog.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_text_field.dart';
import '../../../utils/handlers.dart';

class GetStaffWidget extends StatefulWidget {
  StaffMember staffMember;
   GetStaffWidget({required this.staffMember});

  @override
  State<GetStaffWidget> createState() => _GetStaffWidgetState();
}

class _GetStaffWidgetState extends State<GetStaffWidget> {
  delStaffHandler()async{
    CustomLoader.showLoader(context: context);
    await DeleteAgencyStaffService().deleteStaff(context: context, agentStaffId: widget.staffMember.agentStaffId!);
    CustomLoader.hideLoader(context);
  }
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Person",style: contactStyle,),
            Text("${widget.staffMember.contactPerson}"),
            Text("Email",style: contactStyle,),
            Text("${widget.staffMember.email}"),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(child: Text("Address",style: contactStyle,),flex: 2,),
                Expanded(child: Text("Mobile No",style: contactStyle),flex: 1,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text("${widget.staffMember.address}",style: noStyle,),flex: 2,),
                SizedBox(width: 5.0,),
                Expanded(child: Text("${widget.staffMember.mobile}",style:noStyle ),flex: 1,),
              ],
            ),
            Divider(
              color: black26,
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Actions",style: contactStyle,),
                Spacer(),
                InkWell(
                    onTap: (){
                      editStaffMemberDialog(context);
                    },
                    child: Icon(Icons.edit,color: bgColor,)),
                Container(
                  width: 1.5,
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  height:MediaQuery.of(context).size.height/30,
                  color: blackColor,
                ),
                InkWell(
                    onTap: ()async{
                     await delStaffHandler();
                     getStaffMemberHandler(context);
                    },
                    child: Icon(Icons.delete,color: bgColor,))
              ],
            )


          ],
        ),
      ),

    );
  }

  editStaffMemberDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return EditStaffMemberDialog(
        contactName: widget.staffMember.contactPerson!,
        password: widget.staffMember.password!,
        address: widget.staffMember.address!,
        mobileNo: widget.staffMember.mobile!,
        email: widget.staffMember.email!,
        id:widget.staffMember.id!,
        agentId: widget.staffMember.agentId!,
        agentStaffId: widget.staffMember.agentStaffId!,
      );
    });
  }
}
