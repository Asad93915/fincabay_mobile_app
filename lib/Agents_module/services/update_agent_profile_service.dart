import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

class UpdateAgentProfileService {
  Future updateAgentProfile(
      {required BuildContext context,
      required String userId,
      required String userEmail,
      required String password,
      required String userRole,
      required String name,
      required String mobileNo,
      required String city,
      required String country,
      required String agencyName,
      required String compFax,
      required String serviceDescription,
      required bool isAgent,
      required bool isActive}) async {
    try {
      Map _body = {
        "id": userId,
        "email": userEmail,
        "password": password,
        "roleName": userRole,
        "name": name,
        "phoneNumber": mobileNo,
        "city": city,
        "country": country,
        "agency_Name": agencyName,
        "company_Fax": compFax,
        "services_Description":serviceDescription,
        "isAgent": isAgent,
        "isActive": isActive
      };
      var res = await PostRequestService()
          .httpPostRequest(url: updateAgentProfileUrl, body: _body, context: context);

      if (res != null) {
        print("Agent Profile Update Successfully");
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Update Agent Profile Service $err");
      return null;
    }
  }
}
