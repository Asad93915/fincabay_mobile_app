

import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/api_configs.dart';

class UpdateCustomerProfileService{
  Future updateProfile({required BuildContext context,required String usedId,required String userEmail,required String userRole,required String name,required String password,required String mobileNo,required bool isAgent,required bool isActive})async{
    try{
      Map _body={"id":usedId,"email":userEmail,"roleName":userRole,"name":name,"password":password,"phoneNumber":mobileNo,"isAgent":isAgent,"isActive":isActive};
      var res=await PostRequestService().httpPostRequest(url: updateProfUrl, body: _body, context: context);
      if(res !=null){
        print("Profile Updated Successfully");
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Agent Profile Screen $err");
      return null;
        }
  }
}