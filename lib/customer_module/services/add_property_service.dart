import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/material.dart';

import '../../configs/api_configs.dart';


class AddPropertyService {
  Future addProperty(
      {required BuildContext context,
      required String propertyTitle,
      required String content,
      required String propType,
      required String propPurpose,
      required String price,
      required String landArea,
      required String unit,
      required String noOfBeds,
      required String noOfBaths,
      required String expiryDate,
      required String city,
      required String area,
      required String detailAddress,
      required String email,
      required String password,
      required String signUpAs,
      required String name,
      required bool isLogin,
      required bool isSignup}) async {
    try {
      Map _body = {
        "propertyTitle": propertyTitle,
        "content": content,
        "propertyType": propType,
        "purpose": propPurpose,
        "amount": price,
        "landArea": landArea,
        "selectUnit": unit,
        "noOfBeds": noOfBeds,
        "noOfBaths": noOfBaths,
        "expireAfter": expiryDate,
        "city": city,
        "area": area,
        "detailAddress": detailAddress,
        "userEmail": email,
        "userPassword": password,
        "signUpAs": signUpAs,
        "signUpUserName": name,
        "isLogin": isLogin,
        "isSignUp": isSignup
      };
      var res = await PostRequestService()
          .httpPostRequest(url: addPropertyUrl, body: _body, context: context);
      if (res != null) {
        print("Property Added Successfully");
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Add Property Service $err");
      return null;
    }
  }
}
