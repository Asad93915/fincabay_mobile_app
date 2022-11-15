

import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';

class DeleteUserService{
  Future delUser({required BuildContext context,required userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: delUserUrl+"$userId", context: context);
      if(res !=null){
        print("User Deleted Successfully");
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Delete User Service $err");
      return null;
        }
  }
}