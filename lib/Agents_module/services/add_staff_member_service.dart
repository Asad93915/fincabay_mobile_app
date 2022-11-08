import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/material.dart';

import '../../configs/api_configs.dart';

class AddStaffMemberService {
  Future addStaffMember(
      {required BuildContext context,
      required String agentEmail,
      required String name,
      required String staffEmail,
      required String mobileNo,
      required String password,
      required String address,
      required bool isActive,
      required String roleName

      }) async {
    try {
      Map _body = {
        "agentEmail":agentEmail,
        "userName": name,
        "email": staffEmail,
        "phoneNumber": mobileNo,
        "password": password,
        "address": address,
        "isActive":isActive,
        "roleName":roleName
      };
      var res = await PostRequestService()
          .httpPostRequest(url: registerUrl, body: _body, context: context);
      if (res != null) {
        print("Staff Added Successfully");
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in add staff service $err");
      return null;
    }
  }
}
