

import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:fincabay_application/models/registration_model.dart';
import 'package:fincabay_application/providers/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationService{
  Future registerUser({required BuildContext context,required String userName,required String email,required String mobileNo, required String password })async{
    try{
      Map _body={"name":userName,"emailAdress":email,"mobileNumber":mobileNo,"password":password};
      var res=await PostRequestService().httpPostRequest(url: registerUrl, body: _body, context: context);
      if(res!=null){
        RegistrationModel registration=RegistrationModel.fromJson(res);
        Provider.of<RegistrationProvider>(context,listen: false).updateRegistration(
          newRegistration:registration.data
        );
        print("Success");
        return true;
      }
      else{
        return null;
      }

    }
        catch(err){
      print("Exception in Registration Service $err");
      return null;
        }
  }
}