
import 'package:fincabay_application/Agents_module/models/get_all_staff_member_model.dart';
import 'package:fincabay_application/Agents_module/providers/staff_member_provider.dart';
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GetStaffMemberService{
  Future getStaff({required BuildContext context,required String agentEmail})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getStaffUrl+"AgentEmail=$agentEmail", context: context);
      if(res !=null){
        AllStaffMemberModel staffMember=AllStaffMemberModel.fromJson(res);
        Provider.of<GetStaffProvider>(context,listen: false).updateStafMember(
          newStaff: staffMember.data
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("Exception in get staff member service $err");
      return false;
        }
  }
}