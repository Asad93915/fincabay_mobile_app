import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/material.dart';

import '../../configs/api_configs.dart';

class AddStaffMemberService {
  Future addStaffMember(
      {required BuildContext context,
      required String name,
      required String email,
      required String mobileNo,
      required String password,
      required String address,
      required String agentId
      }) async {
    try {
      Map _body={"name":name,"emailAdress":email,"mobileNumber":mobileNo,"password":password,"address":address,"agentId":agentId};
      var res=await PostRequestService().httpPostRequest(url: registerUrl, body: _body, context: context);
      if(res !=null){
        print("Staff Added Successfully");
        return true;
      }
      else{
        return null;
      }
    }
    catch (err) {
      print("Exception in add staff service $err");
      return null;

    }
  }
}
