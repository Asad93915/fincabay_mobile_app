import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/material.dart';

import '../../configs/api_configs.dart';


class AddPropertyService {
  //yha check kr null konsi value arhi

  Future addProperty({required BuildContext context,
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
    required List<String> uploadImage,

    required String area,
    required String detailAddress,
    required String email,
    required String password,
    required String signUpAs,
    required String name,
    required bool isLogin,
    required bool isSignup}) async {
    try {
      print("list  $uploadImage");
      Map _body = {
        "propertyTitle": propertyTitle,
        "content": content,
        "category": propType,
        "purpose": propPurpose,
        "amount": price,
        "landArea": landArea,
        "unit": unit,
        "noOfBeds": noOfBeds,
        "noOfBaths": noOfBaths,
        "expireAfter": expiryDate,
        // "uploadImage":uploadImage
        "imageUploadString":uploadImage,
        "city": city,
        "area": area,
        "detailAddress": detailAddress,
        "signUpUserEmail": email,
        "userPassword": password,
        "signUpAs": signUpAs,
        "signUpUserName": name,
        "isLogin": isLogin,
        "isSignUp": isSignup
      };
      print("Body $_body");
      var res = await PostRequestService()
          .httpPostRequest(url: addPropertyUrl, body: _body, context: context);
      print("Is Login $isLogin");
      print("Is Signup $isSignup");
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
