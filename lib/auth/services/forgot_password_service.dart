
import 'dart:math';

import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/api_configs.dart';

class ForgotPasswordService{
  Future forgotPassword({required BuildContext context,required String email,required String password})async{
    try{
      Map _body={"email":email,"newPassoword":password};
      var res=await PostRequestService().httpPostRequest(url: forgotPasswordUrl, body: _body, context: context);
      if(res!=null){
        print("Password Changes Successfully");
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Forget Password Service $err");
      return null;
        }
  }
}

