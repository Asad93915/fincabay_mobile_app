import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/api_configs.dart';

class EditStaffMemberService {
  Future editStaff(
      {required BuildContext context,
      required String contactName,
      required String email,
      required String password,
      required String address,
      required String mobileNo,
      required final int id,
      required String agentStaffId,
      required String agentId}) async {
    try {
      Map _body = {
        "contactPerson": contactName,
        "email": email,
        "password": password,
        "mobile": mobileNo,
        "address": address,
        "id": id,
        "agentStaffId": agentStaffId,
        "agentId": agentId
      };
      var res = await PostRequestService()
          .httpPostRequest(url: editStaffUrl, body: _body, context: context);
      if (res != null) {
        print("Agency Staff Updated Successfully");
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Edit Staff Service $err");
      return null;
    }
  }
}
