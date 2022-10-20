import 'package:fincabay_application/auth/models/registration_model.dart';
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/registration_provider.dart';

class RegistrationService {
  Future registerUser(
      {required BuildContext context,
      required String userName,
      required String email,
      required String mobileNo,
      required String password,
      required String phone,
      required String city,
      required String country,
      required String signingUpAs,

      required bool isAgent,
      required String agencyName,
      required String dealCity,
      required String dealMobileNo,
      required String companyPhone,
      required String companyFax,
      required String companyEmail,
      required String serviceDescription

      }) async {
    try {
      Map _body = {
        "name": userName,
        "emailAdress": email,
        "mobileNumber": mobileNo,
        "password": password,
        "phone": phone,
        "city": city,
        "country": country,
        "signing_up": signingUpAs,
        "isAgent": isAgent,
        "agency_Name":agencyName,
        "deal_City":dealCity,
        "deal_MobileNumber":dealMobileNo,
        "company_Phone":companyPhone,
        "company_Fax":companyFax,
        "company_Email":companyEmail,
        "services_Description":serviceDescription
      };
      var res = await PostRequestService()
          .httpPostRequest(url: registerUrl, body: _body, context: context);
      if (res != null) {
        RegistrationModel registration = RegistrationModel.fromJson(res);
        Provider.of<RegistrationProvider>(context, listen: false)
            .updateRegistration(newRegistration: registration.data);
        print("Success");
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Registration Service $err");
      return null;
    }
  }
}
